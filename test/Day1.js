const { expect } = require("chai");

describe("Day1 contract", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const Day1 = await ethers.getContractFactory("Day1");

    const day1 = await Day1.deploy();

    const result = await day1.main("");
    
    expect(result).to.equal(24000);
  });
});