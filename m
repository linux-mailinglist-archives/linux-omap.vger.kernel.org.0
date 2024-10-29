Return-Path: <linux-omap+bounces-2501-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D159B5035
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 18:18:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 578EE28492A
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 17:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA711D356C;
	Tue, 29 Oct 2024 17:18:31 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1172107;
	Tue, 29 Oct 2024 17:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730222311; cv=none; b=sHZQ3HDaI6o8ZpglyMEAVC7+iAIvWWaSCyFpocpI44LL/NvY3cPwk7/8muhnk/SwfQjK3wI/oi/TcMipeBnUmPw6oYaM/xsfeZtfdospUSygqphyE2MqE9sfFhCd1Yq1doZ0bW/TLw47oUvdtPKeYcwvUcMzOHXlvN5H2ufXgiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730222311; c=relaxed/simple;
	bh=FQFD4uMr5FwFyabGa4bZLCg4OXzHpYuyv7FgK3XpFXI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=UzFVGBv1Hh+dZDVTpn7xiXQMERFYzMlWqonHn5Y+mACW4EM/4/eJeTkewLv5/QfgsmyhpnXjGyc0ubc5DHy1nDVccP5EsrHCnnc6I6mIQgchVGWXEs7CM+OTjzy/dQoxGQ7pG6e5Cyb7w894juZ8OxDeaIiNOeWGIso7CjvbqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e59a9496f9so63177147b3.0;
        Tue, 29 Oct 2024 10:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730222307; x=1730827107;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PoG2ltFbfN+WnHJpt5RjjG6F3QLPQGH+biFB2YP687g=;
        b=m8GA6lXLX/cPrTnYMq0txvVRrMpyNNMGB3RvMFURSIn8I45FQXDAWfOniNCGRzahJU
         Ir26clVaUGM4180/BiFYMr+COWm6l7lTABl6yudKa+5iHysOt9ywW/3ygsLEkaWL7U94
         +WTxdiH3Uh9xFtM9LmBxM/SP0LWrT1cgY4O+ZvGd6utmC7zK6rilsD3pGopS3Z6Y48Is
         O/Xp4+zPgMQihY/E6/ohX5Vdcn5iGQOQY0YeW2trSkwsCAG/0L5oL+wdNMKaoy69Ta7x
         TJeL0ZYiLn3B0ib6HyfTgbbGK87hHLg0+Dpk59+3ZLzr1wQj+VhGhPGllUjY3CX/7MK7
         6B6A==
X-Forwarded-Encrypted: i=1; AJvYcCUa3ihp+KgEoYjMYAE2KfGwUoonLKkSqt/Zm9IZJ9Dud/xol/QDCeb4AnZMU4lbQy/mD45mv1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBE+ble5AMs5KbRGbUvlNxWtK/i3tXf+0wnJ32DyUVtXJSDk0v
	hs1BKAOAfQ7Y1/hAdM58XG93vbiF5lWtEbdz1wGSL3qIDVfhqkCj/I3s5vEd
X-Google-Smtp-Source: AGHT+IEBxRyf+UFU+mWLqLU/z24F1xiHXDpjFMKgo3GcqmcoVzpIdFH28jPgmOPRGlsy7r50CobyJQ==
X-Received: by 2002:a05:690c:ecd:b0:6e5:d35b:ca80 with SMTP id 00721157ae682-6e9d88fd872mr115316317b3.5.1730222307449;
        Tue, 29 Oct 2024 10:18:27 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e9c6c96991sm20386147b3.123.2024.10.29.10.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 10:18:27 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e9ed5e57a7so23645677b3.1;
        Tue, 29 Oct 2024 10:18:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXTsHmYxi+m+MTh4GqLzFV8h8iPQGfqvdLLQyVxFDvyzBdSuQ0EOvxmJajUsNjfOCIMkHxhj2Y=@vger.kernel.org
X-Received: by 2002:a05:690c:6885:b0:6dd:fb48:118c with SMTP id
 00721157ae682-6e9d8ab3d0bmr135385657b3.31.1730222306713; Tue, 29 Oct 2024
 10:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Oct 2024 18:18:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
Message-ID: <CAMuHMdX-1bBphfFmEy708MeBePb2pF6rWj0xOjR4d9S-KVgA3A@mail.gmail.com>
Subject: BeagleBone Black Ethernet PHY issues
To: ext Tony Lindgren <tony@atomide.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>
Cc: "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, netdev <netdev@vger.kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi all,

During the last few months, booting kernels on BeagleBone Black
sometimes fails with:

    +SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
LAN8710/LAN8720 failed with error -5
     davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00,
driver SMSC LAN8710/LAN8720
     soc_device_match(cpsw_soc_devices): no match
     cpsw-switch 4a100000.switch: initialized cpsw ale version 1.4
     ...
     am335x-phy-driver 47401300.usb-phy: dummy supplies not allowed
for exclusive requests (id=vbus)
    +cpsw-125mhz-clkctrl:0014:0: failed to disable
     am335x-phy-driver 47401b00.usb-phy: using DT
'/ocp/target-module@47400000/usb-phy@1b00' for 'reset' GPIO lookup
     ...
     cpsw-switch 4a100000.switch: starting ndev. mode: dual_mac
    -SMSC LAN8710/LAN8720 4a101000.mdio:00: attached PHY driver
(mii_bus:phy_addr=4a101000.mdio:00, irq=POLL)
    -cpsw-switch 4a100000.switch eth0: Link is Up - 100Mbps/Full -
flow control off
    -Sending DHCP requests ., OK
    -IP-Config: Complete:
    -[...]
    +cpsw-switch 4a100000.switch: phy
"/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@1000/ethernet-phy@0"
not found on slave 0
    +[HANG]

Adding debug prints to smsc_phy_probe() makes the issue go away, so it
must be timing related.

Adding specific debug prints in the failure case gives:

    SMSC LAN8710/LAN8720 4a101000.mdio:00: genphy_read_abilities:2859:
phy_read(MII_BMSR) failed -EIO
    SMSC LAN8710/LAN8720 4a101000.mdio:00: phy_probe:3613:
genphy_read_abilities() failed -EIO
    SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC
LAN8710/LAN8720 failed with error -5

and later:

    Generic PHY 4a101000.mdio:00: genphy_read_abilities:2859:
phy_read(MII_BMSR) failed -EIO
    Generic PHY 4a101000.mdio:00: phy_probe:3609:
genphy_read_abilities failed -EIO
    cpsw-switch 4a100000.switch: phy
"/ocp/interconnect@4a000000/segment@0/target-module@100000/switch@0/mdio@1000/ethernet-phy@0"
not found on slave 0

Adding debug prints to __mdiobus_read() and davinci_mdio_read() gives:

    mdio_bus 4a101000.mdio: davinci_mdio_read:444:
readl(&data->regs->user[0].access) = 0x3a0ffff
    mdio_bus 4a101000.mdio: __mdiobus_read:900: davinci_mdio_read failed -EIO

but this is a different (and unimportant?) early failure from
smsc_phy_config_intr(), and that debug print actually makes the issue go
away, too.

Ignoring the early failure reveals that phy_read(MII_BMSR) failed due
to:

    mdio_bus 4a101000.mdio: davinci_mdio_read:446:
readl(&data->regs->user[0].access) = 0x20ffff

Anyone with a clue?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

