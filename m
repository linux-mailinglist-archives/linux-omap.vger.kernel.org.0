Return-Path: <linux-omap+bounces-154-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 330A680EF7C
	for <lists+linux-omap@lfdr.de>; Tue, 12 Dec 2023 15:59:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8A49B20E7F
	for <lists+linux-omap@lfdr.de>; Tue, 12 Dec 2023 14:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84C4745F1;
	Tue, 12 Dec 2023 14:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EUzDlqbt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74DD6DB;
	Tue, 12 Dec 2023 06:58:43 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28abda9e99bso426425a91.3;
        Tue, 12 Dec 2023 06:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702393122; x=1702997922; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Rb/ZIJedLrdL3LpmiWGZ0IPuPLhjP9882DXO/DSL5I=;
        b=EUzDlqbtjUcM9Z0P8j8QMUNCbEtAWPIB9fA/KYBfUsxcpQFLUxeCh2etehPvv9xlwj
         kKcVAA50IJWh/WLmNQ1VfHixYSsfB8nK8Kr2duOcLrm2Lod5+LW+coFvNzgBRtwNBVA8
         UFE8kLvrGKSIBDidBZ6tnyfXAY95oH5GXFkkaXXKaRQieQwc8fAjVQw1iTs61IGpcgjp
         PzsWsyyxRr5oJ21wn/X5IPsqBgtlxH4yC/llR3XRGO7Ah6l7zmShdUoC4/EjslmFSwiL
         V051sUAw+HEOlFQuwUbneQC5emWHAe80w/EMsyMfYh8eCaUldTPhojJxSvNJ1A6zn8Ue
         XOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702393122; x=1702997922;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Rb/ZIJedLrdL3LpmiWGZ0IPuPLhjP9882DXO/DSL5I=;
        b=L7m668IZf3la1e2rXG9AdzpIbk6yp1qT+n0MUXm1x2SYK6ifQlJ/jIK0xWirA4yMIr
         Ptn6crS7ymO8oXtbXqIllDhOvT/gjazbV15QAJdotDVlgXhTcndDgsxFeOEU3Fgx87wx
         wQ7Hxte/bO9z672EWYSeyvythITY/TL0iqT4oQJYljiLAlFdwheu5HL//lX/6UwFB256
         y8AtztwsIHUYFD590A0+fD3NsXA2sotrIo8v0SUSTPTcQFVFlyLDSzR3uNwU2tsij3JN
         146DDdt5yxXhMW9dyPEWUYsMx8uFe2cMVBgb7tndHzFwOL2Iaq8YHkjI4CkL40V2dAYj
         XOrw==
X-Gm-Message-State: AOJu0YxLrljjZJaS31bys0A3gZrpkmXUtunEp4alkamokqedSKcrbXLm
	NJ6TNlfHPnvTadkOVtPecaKmVqcp2Z7JxL5vawT/oJzk+cw=
X-Google-Smtp-Source: AGHT+IEHNadR61wKKckN1gdGwV6sHGIutBzzwsn1HLjadaM7Zo/rXr3gFk0SsHyWTPRbtePGfqcrG3pWGDIyiLR5YH4=
X-Received: by 2002:a17:90a:b78d:b0:28a:d721:adef with SMTP id
 m13-20020a17090ab78d00b0028ad721adefmr105525pjr.19.1702393122364; Tue, 12 Dec
 2023 06:58:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Adam Ford <aford173@gmail.com>
Date: Tue, 12 Dec 2023 08:58:31 -0600
Message-ID: <CAHCN7xKGW4j6HsELJNbT10OyNX0zx2207nz=AQ97VxKJaEQkyg@mail.gmail.com>
Subject: ehci-omap unresponsive when used with external hub
To: Linux-OMAP <linux-omap@vger.kernel.org>
Cc: USB list <linux-usb@vger.kernel.org>, stern@rowland.harvard.edu, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I have been troubleshooting an issue with USB which appears to happen
with  AM3517, OMAP3530,  and DM3730 in which the USB doesn't detect
removal or connection of USB devices and interrupts stop occurring.

In every case, I have the OMAP3 EHCI connected to a USB3220
transceiver which is treated as configured in the device tree as
usb-nop-xceiv with reset-gpios configured to enable it.

When I connect and disconnect peripherals like thumb drives,
keyboards, mice, etc., directly to the USB port, the system seems to
behave as I would expect.  If I connect a hub with a device already
connected to it, the system recognizes the attached device

peripheral -> external hub -> transceiver -> omap3-ehci

If I disconnect the hub from the OMAP, it also sees the disconnection
and subsequent reconnection.

However, if I connect a hub with nothing attached to the hub, I get
the following message:

ehci-omap 48064800.ehci: suspend root hub

At this point, no disconnection or reconnection are ever recognized,
and no further interrupts are recorded on the ehci-omap from
/proc/interrupts.

If I pass "optargs usbcore.autosuspend=-1" to as a command line
parameter, the system works as expected.  I have been able to
replicate this issue with multiple external hubs, and I am beginning
to test this work-around with different hubs, but it seems like
disabling autosuspend is a hack.

I was wondering if there might be a better solution and/or suggestions
as to what needs to happen to poll the USB occasionally to see if
there are devices present.

Thanks

adam

