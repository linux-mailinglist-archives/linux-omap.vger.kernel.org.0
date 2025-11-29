Return-Path: <linux-omap+bounces-5076-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF27C94169
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 16:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 404724E2550
	for <lists+linux-omap@lfdr.de>; Sat, 29 Nov 2025 15:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE3C205E25;
	Sat, 29 Nov 2025 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZXoS9j/q"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAF936B;
	Sat, 29 Nov 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764431091; cv=none; b=OWHSbD+YOjc9cemR4A8O2AZ8mvBJBO1/6jyfwnt93UCaIl2sZ41kaoa14g588+5CtHGnV6T5VrkoK833HS9O5PACoNMcELtfE5QfMAURnpH0xRNn+9W0L9SI4wakf8l1YyqZ0XmX6WSPyk449br90320uZSQBWRIZ6QFIaaszIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764431091; c=relaxed/simple;
	bh=0UANz+DgS6lbWIrceFwDIral2u/fvRmP+7PtS4MXcYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iAHs8dlh0qRdUrXQx9x4dBL9GJsyn7FDpT7cBnrjyJN38vmiWQ/sm7DtBkn9MG91tOZBz4KV5MPkM5LTdlRFDIYWprVTHJ+fk1mAW6wjDQVg7TCtoKYWpzAfFleQQo7qAH61EUfy0EnSFMunkiKewf/ZYRO+34bOiHQ19c3zh2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZXoS9j/q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD81DC4CEF7;
	Sat, 29 Nov 2025 15:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764431090;
	bh=0UANz+DgS6lbWIrceFwDIral2u/fvRmP+7PtS4MXcYI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZXoS9j/q72buF0f1wJAPgpewZ8Lz6+0apL/gWGY5ZRMgeutubTa77wj7A8FXqYjz5
	 SQufS3a6jc5W2Cze5kzp+FxmaY+xMyK3ZfkyzOeoeb9IpTYriE2tyVYwomTOWBPbwl
	 vtwBU14yKtVvP07LNvPRdz1DuEhMaXnURAvbyJELmDLAn2iTesmoMcWOKt7pK4L/ZN
	 t7e3/7DlPJfZfK06X2R/d5E9sK5JsRNv8F0EFSPKcjW8A9obxOPPAF0yFp9idATvqC
	 2xOW46FNTsnGm4b0G/tv7g6TujvwZm8uhNgF4y13h0KXjW3woPYs0MNfjSiMn7mA+/
	 Hd2b0K2loMoKQ==
Message-ID: <8b0e2b8a-314f-40ee-8f30-c281f3799705@kernel.org>
Date: Sat, 29 Nov 2025 16:44:44 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: Document new common property:
 has-inaccessible-regs
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Lee Jones <lee@kernel.org>, dakr <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, tony <tony@atomide.com>,
 rogerq <rogerq@kernel.org>, khilman <khilman@baylibre.com>,
 Andreas Kemnade <andreas@kemnade.info>, aaro koskinen
 <aaro.koskinen@iki.fi>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, robh <robh@kernel.org>
References: <20251129142042.344359-1-richard@nod.at>
 <20251129142042.344359-2-richard@nod.at>
 <7d9fcf24-5ad5-48cf-b36d-83025976f3aa@kernel.org>
 <771947541.4509.1764430418744.JavaMail.zimbra@nod.at>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <771947541.4509.1764430418744.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/11/2025 16:33, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
>> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
>> On 29/11/2025 15:20, Richard Weinberger wrote:
>>> This property is used to denote that a certain register map contains
>>> registers that are inaccessible under conditions only a device driver
>>> can know.
>>
>> So device driver controls fully their exposure via sysfs.
>>
>> Binding cannot help here at all.
> 
> The driver does not expose them via sysfs, it's the regmap framework via debugfs.

Driver always tells the regmap which registers are valid. This is not a
new problem, we had it in several devices and fixed drivers.

>  
>>> The purpose of this property is to disable register access through debug
>>> facilities outside of the device driver.
>>
>> You described OS policy which is not suitable for bindings at all. Plus
>> commit msg really mixes up two separate points - buggy driver which
>> fails to properly set regmap (or other facility) with some DT-based
>> restrictions.
> 
> I kind of expected this answer. ;-)
> 
> Currently arch/arm/boot/dts/ti/omap/dra7-l4.dtsi binds CTRL_MODULE_CORE to the syscon mfd driver
> and various child nodes bind to subranges.
> e.g.
> scm_conf: scm_conf@0 {
>         compatible = "syscon", "simple-bus";
>         reg = <0x0 0x1400>;
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges = <0 0x0 0x1400>;
>         has-inaccessible-regs;
> 
>         pbias_regulator: pbias_regulator@e00 {
>                 compatible = "ti,pbias-dra7", "ti,pbias-omap";
>                 reg = <0xe00 0x4>;
>                 syscon = <&scm_conf>;
>                 pbias_mmc_reg: pbias_mmc_omap5 {
>                         regulator-name = "pbias_mmc_omap5";
>                         regulator-min-microvolt = <1800000>;
>                         regulator-max-microvolt = <3300000>;
>                 };      
>         };      
> 
>         phy_gmii_sel: phy-gmii-sel@554 {
>                 compatible = "ti,dra7xx-phy-gmii-sel";
>                 reg = <0x554 0x4>;
>                 #phy-cells = <1>;
>         };      
> 
>         scm_conf_clocks: clocks {
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>         };      
> };
> 
> So, drivers like ti,pbias-dra7 or ti,dra7xx-phy-gmii-sel touch only registers
> they know about and this works well.
> But syscon manages the whole register map via regmap, and regmap exposes it all
> via debugfs.
> 
> What solution do you propose?
> Splitting reg = <0x0 0x1400> into many tiny fractions and not using an mfd anymore?

Fix the driver. In your case, the syscon driver.


Best regards,
Krzysztof

