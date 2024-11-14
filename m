Return-Path: <linux-omap+bounces-2676-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B413D9C8790
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 11:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A05D1F21DE4
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2024 10:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88201F8EE9;
	Thu, 14 Nov 2024 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="lLwYEaAs"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B865B1F8EEB
	for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 10:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731579781; cv=none; b=jTRnZyns+u50XQGecQTxNI2garfQtqX7rcDIke0hjzhUTdbhJijBqIXwSZfQxuLjHOJlWepc3k37jp9HRCMrNCtTpzP3AKexVWPBECPRAWC3K9Am6fSxsdViZNHbqWHVtXwAtOkVVC0wMw2ESOvF2adQ01ZJLAHPS45RTc8V9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731579781; c=relaxed/simple;
	bh=rApyfxH8mXrGklMkKtf8r3GChIyc9ogMoGhPjW6oXx4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=X4upHwEZpVtZTN1BdBGWdFK4yMDysEKDSMz1Tj1AmBw30O2lw6jxPra+HhQFp5yLuzxODHTS3nhYxi41d54pk57EpA4rKbib51KyGHvn+1oE5/Xi75dYssLdMev06k0nsNba2lUKN1dl0ahrmtRPlfNnf0K4AuLzdWPTgb/fg+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=lLwYEaAs; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43161c0068bso4059405e9.1
        for <linux-omap@vger.kernel.org>; Thu, 14 Nov 2024 02:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1731579777; x=1732184577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0MF/HiRlFNO6XRilFjbbpUsQFR+N/oH7SwfV+tSLhoQ=;
        b=lLwYEaAsxNabjJe4rNVZAdqcQ84cHed62hdbBOhobFSZZfJ38YcNPIGScoEzHFO17W
         FgPmFJ88XidXyfbEh4+ghKMnlUP474s41K8b9uoUKlmXCSbJ7tNh+3ZLlRp5jYiClHEa
         UM46cipX2RL7nLQjtv4hJFGE/LjE2TLY6Hins=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731579777; x=1732184577;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0MF/HiRlFNO6XRilFjbbpUsQFR+N/oH7SwfV+tSLhoQ=;
        b=WlM7I6KK8EzUX+FD/Gin0xC+PoUPBpqeNhhvOa5lFWQpUahAbj07eHdFJ4DHtT3b+u
         oRohyJtA5gPRMqC7FoEGYz2KiFNa488C0pXDqN1Z4tzYQ++QFKQ3R/pJJPCkNlu62o1g
         nULNl/jJNAJ7ttPY4JxUynm8ccLD24y2g5uXv8ZvQw3DylIoke37vN6GwmLVDb97J/QJ
         g88dDohyGBCsOK8bszhdgc3L25mspuxueiXf7snFxRgCXhMWwnBIABSujaLGCAWZmrDh
         2iqEd23ekosKU1RZ6FhQ93b5/GlOXmZq7ZHXML/wosiwTBkqPTTSpbOOPfmLIzzBijTn
         R/CA==
X-Forwarded-Encrypted: i=1; AJvYcCUAjsQmlbkEV1nlo+ta03hdGn+9rtrifs5GMlZvpBke2Kj+q01Ky27ECkK6lxyOERPQZ/Ej3YhyxJNs@vger.kernel.org
X-Gm-Message-State: AOJu0YxHHEs+IG2SYet1MyLFlFJ5cKEf3IZ+nfFOEwGObAmX16O9NG5L
	sj3ueWj+S5hIdLn5uEOM6kHQrJoZvncwkVjxEtXwIi7Ncyji94y2gL9cjVDi3Ig=
X-Google-Smtp-Source: AGHT+IFJ3wF59DokE4/jq86pt+yb1ZVYpe4DvQ/5j0vsC2E0MaJkFpw+liNIyVdNq2zfyOa6BqEW8g==
X-Received: by 2002:a05:600c:1e1e:b0:431:52a3:d9ea with SMTP id 5b1f17b1804b1-432da6cf232mr15371785e9.0.1731579776926;
        Thu, 14 Nov 2024 02:22:56 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f? (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821c57d4ebsm777536f8f.14.2024.11.14.02.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 02:22:56 -0800 (PST)
Message-ID: <9d030892-8639-4bb0-9225-f84d43e17fd8@smile.fr>
Date: Thu, 14 Nov 2024 11:22:55 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] ARM: dts: Configure interconnect target module for
 dra7 sata
From: Romain Naour <romain.naour@smile.fr>
To: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 Roger Quadros <rogerq@kernel.org>
Cc: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
 devicetree@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-pci@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, robin.murphy@arm.com
References: <20210126124004.52550-1-tony@atomide.com>
 <20210126124004.52550-8-tony@atomide.com>
 <c583e1bb-f56b-4489-8012-ce742e85f233@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <c583e1bb-f56b-4489-8012-ce742e85f233@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

Le 12/11/2024 à 15:15, Romain Naour a écrit :
> Hello Tony, Roger, All,
> 
> Le 26/01/2021 à 13:39, Tony Lindgren a écrit :
>> We can now probe devices with device tree only configuration using
>> ti-sysc interconnect target module driver. Let's configure the
>> module, but keep the legacy "ti,hwmods" peroperty to avoid new boot
>> time warnings. The legacy property will be removed in later patches
>> together with the legacy platform data.
>>
>> Note that the old sysc register offset is wrong, the real offset is at
>> 0x1100 as listed in TRM for SATA_SYSCONFIG register. Looks like we've been
>> happily using sata on the bootloader configured sysconfig register and
>> nobody noticed. Also the old register range for SATAMAC_wrapper registers
>> is wrong at 7 while it should be 8. But that too seems harmless.
>>
>> There is also an L3 parent interconnect range that we don't seem to be
>> using. That can be added as needed later on.
> 
> Since the switch from a kernel 5.10 to 6.1, the dra7 (AM574x) sata interface
> doesn't work as expected.
> 
> Using a kernel 6.1 with a preformated ext4 SATA disc, any copied file will be
> corrupted when the filesystem is umounted.
> 
> mount /dev/sda1 /mnt
> cp /<test_file> /mnt/
> sync
> sha256sum /mnt/<test_file> /<test_file>
> <same hash>
> umount /mnt
> 
> mount /dev/sda1 /mnt
> sha256sum /mnt/<test_file> /<test_file>
> /mnt/<test_file> is corrupted.
> 
> git bisect report 8af15365a368 ("ARM: dts: Configure interconnect target module
> for dra7 sata") as the first bad commit [1] (merged in 5.13).
> 
> While looking for existing SATA issue on dra7 SoC, I found this old patch:
> 
> "On TI Platforms using LPAE, SATA breaks with 64-bit DMA. Restrict it to
> 32-bit." [2].
> 
> Even if it's not the correct fix, disabling 64-bit DMA allows to use the sata
> disc correctly. The discussion about this issue seems to have stopped [3] and
> the suggested change was never merged.
> 
> The SATA port is unlikely not available on TI AM57 EVM boards or the beaglebone-AI.
> 
> Any suggestion?

It seems we have to use a pseudo-bus to constrain sata dma size (see [1])

But the sata node is placed inside a "ti,sysc-omap4" node, it's not clear if we
can do that.

target-module@40000 {			/* 0x4a140000, ap 31 06.0 */
    compatible = "ti,sysc-omap4", "ti,sysc";
    reg = <0x400fc 4>,
            <0x41100 4>;
    reg-names = "rev", "sysc";
    ti,sysc-midle = <SYSC_IDLE_FORCE>,
            <SYSC_IDLE_NO>,
            <SYSC_IDLE_SMART>;
    ti,sysc-sidle = <SYSC_IDLE_FORCE>,
            <SYSC_IDLE_NO>,
            <SYSC_IDLE_SMART>,
            <SYSC_IDLE_SMART_WKUP>;
    power-domains = <&prm_l3init>;
    clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 0>;
    clock-names = "fck";

    #size-cells = <2>;
    #address-cells = <2>; // [2] parent-bus-address
    ranges = <0x0 0x0 0x40000 0x0 0x10000>;

    aux_bus: aux_bus {
        #address-cells = <2>; // [1] child-bus-address
        #size-cells = <2>; // [3] length
        compatible = "simple-bus";
        ranges;
        dma-ranges = <0x0 0x0 0x0 0x0 0x1 0x00000000>;
        /*           | [1]   |[2]    | [3] | */
        /* dma-ranges = <child-bus-address, parent-bus-address, length> */

        sata: sata@0 {
            compatible = "snps,dwc-ahci";
            reg = <0x0 0x0 0x0 0x1100>, <0x0 0x0 0x0 0x8>;
            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
            phys = <&sata_phy>;
            phy-names = "sata-phy";
            clocks = <&l3init_clkctrl DRA7_L3INIT_SATA_CLKCTRL 8>;
            ports-implemented = <0x1>;
        };
    };
};

Note: ti,sysc-omap4 doesn't allows anything than #address-cells = <1> and
#size-cells = <1> before commit [2].

bus: ti-sysc: Remove open coded "ranges" parsing

    "ranges" is a standard property and we have common helper functions for
    parsing it, so let's use them.


[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=2a2ab4d5206d25875e30a8a8153f0b4f3c951ee4

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=41e4f807f85d02a44426b87e01ed98b191dbbf9d

Best regards,
Romain


> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=8af15365a36845c4c15d4c8046ddccff331d5263
> [2] https://lore.kernel.org/all/20200206111728.6703-1-rogerq@ti.com/T/
> [3] https://lore.kernel.org/lkml/c753a232-403d-6ed2-89fd-09476c887391@ti.com/
> 
> Best regards,
> Romain
> 
> 
>>


