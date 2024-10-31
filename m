Return-Path: <linux-omap+bounces-2549-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B94689B7710
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 10:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E0262821E0
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 09:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8571B192D60;
	Thu, 31 Oct 2024 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsngxzJC"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F251BD9ED;
	Thu, 31 Oct 2024 09:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730365615; cv=none; b=bjizWidBbMice+/UwnwjmqwYOjnln7ArAgwiMdyK7C9SPsU6JC5I8Mu+cfMezexHM1mFVE820mf5jQVzLwDPOQL2XT642S7cVLiO0vKOR1Pia3uoquymy6g0aMzNRG5cq01UYA4UowxF8ITkI0pW3iDAfZ77BDVTnhjyhNQuX64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730365615; c=relaxed/simple;
	bh=jRK9phKHkchO0mnknTshDeyU8PEHorjApsaAP1BtGM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qHCoqfVT7BPfn92+eLG264S983bUDSORhrtaSemU2zT7eUQbOi1XgeXVvpO5cEmWiyS6LBMyJtB9EnbXIIV25tXMZcjfnLnrIY76tsxCM+LQk31adESk8TvBZFSddvHn3qolbv+cHjaXMHfZV9GdJY7iW8blQG5MwdfAiduZRgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsngxzJC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AC9C4CEC3;
	Thu, 31 Oct 2024 09:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730365615;
	bh=jRK9phKHkchO0mnknTshDeyU8PEHorjApsaAP1BtGM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WsngxzJC4E1+qV9IM631Ja9WXQOHWGKm2xL8Rp6W52SS963iSAacmobvKtFsy9Zm1
	 L8gfMhAMdZqkInyy8xdsDvI6Ivof++6lcv7y2rbFWTVKsWW1hCqyi2lp/5Tip/wYkq
	 AUKTb++jTVCPBfnk0DW1A6yhMSBx0HtKLAbRUvQ9WPE8s63xn0qmcmGzp96/DemFGI
	 wWxGFXs1pWgBAvt0sZfQZhsP5j5TZY/5x1lXfCsILvdQpI/cyqKbZJUWkYc/PSnzDS
	 6c+KaMDXBzphi1Xi33xXbVkCVjfW2cOQfLLKtuC8nWM6SzcuZy4JAONzh9Ne+pYmOP
	 5PyVpooPRm6lQ==
Message-ID: <cd120c6b-e469-46d9-95b5-71a8cc6513cf@kernel.org>
Date: Thu, 31 Oct 2024 11:06:50 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: BeagleBone Black Ethernet PHY issues
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ext Tony Lindgren <tony@atomide.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Matti Vaittinen <mazziesaccount@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
 <1f927944-30aa-4298-9bd0-d9d3ace3fc78@kernel.org>
 <CAMuHMdVN_xNLTvy9u6FvK=agSAUzSHxEuyBS37sOA7jpGLwddw@mail.gmail.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <CAMuHMdVN_xNLTvy9u6FvK=agSAUzSHxEuyBS37sOA7jpGLwddw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 30/10/2024 17:08, Geert Uytterhoeven wrote:
> Hi Roger,
> 
> On Wed, Oct 30, 2024 at 1:58 PM Roger Quadros <rogerq@kernel.org> wrote:
>> On 29/10/2024 19:18, Geert Uytterhoeven wrote:
>>> During the last few months, booting kernels on BeagleBone Black
>>> sometimes fails with:
>>>
>>>     +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
>>> LAN8710/LAN8720 failed with error -5
> 
> [...]
> 
>> Just wondering if the Reset is happening correctly and it has settled
>> before PHY access.
>>
>> From arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
>>
>> &davinci_mdio_sw {
>>         pinctrl-names = "default", "sleep";
>>         pinctrl-0 = <&davinci_mdio_default>;
>>         pinctrl-1 = <&davinci_mdio_sleep>;
>>
>>         ethphy0: ethernet-phy@0 {
>>                 reg = <0>;
>>                 /* Support GPIO reset on revision C3 boards */
>>                 reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
>>                 reset-assert-us = <300>;
>>                 reset-deassert-us = <13000>;
>>         };
>> };
>>
>> Do we need to increase reset-deassert-us for some reason?
> 
> Thanks for the hint!
> 
> This is indeed on Rev. C3 (my other boards are Rev. A5C or C, but
> I don't test boot recent kernels on them, as they are in active use).
> 
> Multiplying reset-deassert-us by 10 gives me a booting board.
> More experiments reveal that I need a delay of 14 ms to boot
> successfully, and 15 ms to avoid the early __mdiobus_read()
> failure, too.
> 
>> I couldn't find MII ready time after reset de-assert information form the
>> PHY datasheet. except the following line [1].
>> "For the first 16us after coming out of reset, the MII/RMII interface will run at 2.5 MHz. After this time, it will
>> switch to 25 MHz if auto-negotiation is enabled"
>>
>> [1] 3.8.5 RESETS
>> https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/LAN8710A-LAN8710Ai-Data-Sheet-DS00002164.pdf
> 
> 3.8.5.1 Hardware Reset
> "A Hardware reset is asserted by driving the nRST input pin low. When
>  driven, nRST should be held low for the minimum time detailed in
>  Section 5.6.3, "Power-On nRST & Configuration Strap Timing," on page
>  60 to ensure a proper transceiver reset."
> 
> 5.6.3 POWER-ON NRST & CONFIGURATION STRAP TIMING
> "For proper operation, nRST must be asserted for no less than trstia."
> 
> TABLE 5-8: POWER-ON NRST & CONFIGURATION STRAP TIMING VALUES
> "trstia nRST input assertion time min. 100 µS"
> 
> On Rev. C3, ETH_RESETn is controlled by an open-drain AND gate.
> It is pulled high by a 10K resistor, and has a 4.7µF capacitor to
> ground.  That gives an RC constant of 47ms.  As you need 0.7RC to charge
> the capacitor above the threshold voltage of a CMOS input (VDD/2),
> reset-deassert-us should be at least 33ms. Considering the typical
> tolerance of 20% on capacitors, 40ms would be safer. Or perhaps
> even 50ms?

Super! Yes, I agree 50ms would be a good setting.

> 
> If you agree, I can send a patch.
> Thanks!

Much appreciated, thanks!

-- 
cheers,
-roger

