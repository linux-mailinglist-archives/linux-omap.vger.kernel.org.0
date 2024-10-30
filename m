Return-Path: <linux-omap+bounces-2519-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F69B6397
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 13:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A28A61F22C16
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 12:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD121EABD0;
	Wed, 30 Oct 2024 12:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RA+8LOEf"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE5D1E9067;
	Wed, 30 Oct 2024 12:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730293105; cv=none; b=A+Y3EuQ9qtjuT9EdKSyy0pwPzNlTgTMqFu8VSRPJYBoxCkJZ99nRIbnchrrckT230f4kiRpVxaIPtbMV+CwhidwQv1hm17YrWWMQ+jW4Q3hZIf+IaVDn2EhS4XhdZ2aghIvDkEXyXDZzIXl6kEZ6DtIAoonYUkrfZOACbBW1R/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730293105; c=relaxed/simple;
	bh=fy/EhC/8o0exDek8z8nglJ/dyarxYaGCj12JxahYLIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFXpCD8GvV95PMnH5qjJP8LLM9Bf1CLgWNaZH7YPVHZE7N3K2WxqoJD9hE8SFwnSQzJeTC2CCWGjU2UHg4bpuxpXaf9KR/tsSep7j0T1XZEa9SlhnBb9ssziZfTMoFltlP5lA90esgpLgeMPiLVkuSU+glXaUB90OeL8Kf5n4jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RA+8LOEf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FCDC4CEE5;
	Wed, 30 Oct 2024 12:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730293104;
	bh=fy/EhC/8o0exDek8z8nglJ/dyarxYaGCj12JxahYLIc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RA+8LOEfYcDTvk69kaJ9WPB9j4Gn0OEMDR+/ituO+ibkq3Jq+zUqw22oXelG3siFc
	 Cm7SbDXYTpdhqxzNRwB4hmf9G5QyK+dOhE8/cidm74X6KYi1kTJEJG7EnPCxG9VVjj
	 SGR2Qn04t0NBr2ELbKrbrYOQHvTT42XpNdc4kXpVWdAp91g2Znxa8pjrJBLNVbzjm/
	 hZeSrYD4uHi1vPXOwPsqT3hwk2AoPUJtu/yFGaVRWIF8LvMc25MQSyWb9zkbjb6Bsy
	 sd8PrU6930icLBk7vMK+ybLhhD+iRBzSWTsc/2gFARmMyNPODjSb2aLvDjBawZoIj1
	 0l4/gAZPPBAoA==
Message-ID: <1f927944-30aa-4298-9bd0-d9d3ace3fc78@kernel.org>
Date: Wed, 30 Oct 2024 14:58:20 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 ext Tony Lindgren <tony@atomide.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: "open list:TI ETHERNET SWITCH DRIVER (CPSW)"
 <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Geert,

On 29/10/2024 19:18, Geert Uytterhoeven wrote:
> Hi all,
> 
> During the last few months, booting kernels on BeagleBone Black
> sometimes fails with:
> 
>     +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> LAN8710/LAN8720 failed with error -5
>      davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00,
> driver SMSC LAN8710/LAN8720
>      soc_device_match(cpsw_soc_devices): no match
>      cpsw-switch 4a100000.switch: initialized cpsw ale version 1.4
>      ...
>      am335x-phy-driver 47401300.usb-phy: dummy supplies not allowed
> for exclusive requests (id=vbus)
>     +cpsw-125mhz-clkctrl:0014:0: failed to disable
>      am335x-phy-driver 47401b00.usb-phy: using DT
> '/ocp/target-module@47400000/usb-phy@1b00' for 'reset' GPIO lookup
>      ...
>      cpsw-switch 4a100000.switch: starting ndev. mode: dual_mac
>     -SMSC LAN8710/LAN8720 4a101000.mdio:00: attached PHY driver
> (mii_bus:phy_addr=4a101000.mdio:00, irq=POLL)
>     -cpsw-switch 4a100000.switch eth0: Link is Up - 100Mbps/Full -
> flow control off
>     -Sending DHCP requests ., OK
>     -IP-Config: Complete:
>     -[...]
>     +cpsw-switch 4a100000.switch: phy
> "/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@1000/ethernet-phy@0"
> not found on slave 0
>     +[HANG]
> 
> Adding debug prints to smsc_phy_probe() makes the issue go away, so it
> must be timing related.
> 
> Adding specific debug prints in the failure case gives:
> 
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: genphy_read_abilities:2859:
> phy_read(MII_BMSR) failed -EIO
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: phy_probe:3613:
> genphy_read_abilities() failed -EIO
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
> LAN8710/LAN8720 failed with error -5
> 
> and later:
> 
>     Generic PHY 4a101000.mdio:00: genphy_read_abilities:2859:
> phy_read(MII_BMSR) failed -EIO
>     Generic PHY 4a101000.mdio:00: phy_probe:3609:
> genphy_read_abilities failed -EIO
>     cpsw-switch 4a100000.switch: phy
> "/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@1000/ethernet-phy@0"
> not found on slave 0
> 
> Adding debug prints to __mdiobus_read() and davinci_mdio_read() gives:
> 
>     mdio_bus 4a101000.mdio: davinci_mdio_read:444:
> readl(&data->regs->user[0].access) = 0x3a0ffff
>     mdio_bus 4a101000.mdio: __mdiobus_read:900: davinci_mdio_read failed -EIO
> 
> but this is a different (and unimportant?) early failure from
> smsc_phy_config_intr(), and that debug print actually makes the issue go
> away, too.
> 
> Ignoring the early failure reveals that phy_read(MII_BMSR) failed due
> to:
> 
>     mdio_bus 4a101000.mdio: davinci_mdio_read:446:
> readl(&data->regs->user[0].access) = 0x20ffff
> 
> Anyone with a clue?

Just wondering if the Reset is happening correctly and it has settled
before PHY access.

From arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi

&davinci_mdio_sw {
        pinctrl-names = "default", "sleep";
        pinctrl-0 = <&davinci_mdio_default>;
        pinctrl-1 = <&davinci_mdio_sleep>;

        ethphy0: ethernet-phy@0 {
                reg = <0>;
                /* Support GPIO reset on revision C3 boards */
                reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
                reset-assert-us = <300>;
                reset-deassert-us = <13000>;
        };
};

Do we need to increase reset-deassert-us for some reason?

I couldn't find MII ready time after reset de-assert information form the
PHY datasheet. except the following line [1].
"For the first 16us after coming out of reset, the MII/RMII interface will run at 2.5 MHz. After this time, it will
switch to 25 MHz if auto-negotiation is enabled"

[1] 3.8.5 RESETS
https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

-- 
cheers,
-roger

