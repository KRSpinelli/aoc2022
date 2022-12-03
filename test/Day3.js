const { expect } = require("chai");

describe("Day3 contract", function () {
  it("Deployment should assign the total supply of tokens to the owner", async function () {
    const [owner] = await ethers.getSigners();

    const Day3 = await ethers.getContractFactory("Day3");

    const day3 = await Day3.deploy();

    const result =  await day3.main("");
    
    expect(result.toString()).to.equal("157,70");
  });
});