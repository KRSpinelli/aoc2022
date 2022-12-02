const fs = require('fs');
var input = "";
fs.readFile('/Users/kyle/projects/aoc2022/inputs/day2.txt', 'utf8', (err, data) => {
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

  const Day2 = await ethers.getContractFactory("Day2");
  const day2 = await Day2.deploy();

  console.log("Day2 address:", day2.address);

  const result = await day2.main(input);
  console.log("Result:", result.toString());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
