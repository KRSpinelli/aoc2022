const fs = require('fs');
var input = "";
fs.readFile('/Users/kyle/projects/aoc2022/inputs/day1.txt', 'utf8', (err, data) => {
  if (err) {
    console.error(err);
    return;
  }

  input = data;

});

async function main() {
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with the account:", deployer.address);

  console.log("Account balance:", (await deployer.getBalance()).toString());

  const Day1 = await ethers.getContractFactory("Day1");
  const day1 = await Day1.deploy();

  console.log("Day1 address:", day1.address);

  const result = await day1.main(input);
  console.log("Result:", result.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

// describe("Day1 contract", function () {
//   it("Deployment should assign the total supply of tokens to the owner", async function () {
//     const [owner] = await ethers.getSigners();

//     const Day1 = await ethers.getContractFactory("Day1");

//     const day1 = await Day1.deploy();

//     console.log(await day1.main(input));

//     const result = await day1.main("");
//     // console.log(await day1.main(input))
//     expect(result).to.equal(24000);
//   });
// });