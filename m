Return-Path: <linux-omap+bounces-1927-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C859D957194
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 19:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17B761F23C1C
	for <lists+linux-omap@lfdr.de>; Mon, 19 Aug 2024 17:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F0B6179202;
	Mon, 19 Aug 2024 17:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuguUdG9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAAF44C86;
	Mon, 19 Aug 2024 17:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087330; cv=none; b=VVxtSoMX63DZHOSH+6+gxpQu/FtTJu0ez/fESFzgQNrk1yYvTiAxQBBI7dP/okPnii8fT/5xjuTJBfsFzj8aKNJV4JTbRan4PXaTIFGm32Z+cAhj7Ajo6FWaaljfMdrPB3zdm6gN+CYBjonfxGeMiN2OcplHU/mcyrr2RKQP5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087330; c=relaxed/simple;
	bh=B+WSAhARzIa8RfsuUPbOfLap4NV0ys36VRA1BvkoZuo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xq0tGAWk4OrD5qcXIfGBTdtDdzZwa/8GDTGOCxe6r2Nc49O3Qf8XIvkfs2Mqkljxr5iF9PM4faNh7ikQT2BtqWg+IEA3I/s4BRmMstdXnSE7rUhO9si1QItHid9cRNCKnW8hxqCdMsIHC86Lqg+KVlMyeacQTf+LspUBwr95ehg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jeremypeper.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuguUdG9; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jeremypeper.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-39d3cd4fa49so5384805ab.1;
        Mon, 19 Aug 2024 10:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724087327; x=1724692127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtlTKJbHiAYCUCklHDfN5OAWyNL6/u/SANPFYo6wU2s=;
        b=KuguUdG9MP8L6lP9KBO/BOs9uRR1nW9oP9JhIqoCyfYpCD1/B2C8MWpbL+MPZ9bkx5
         Rt1HvdVCw0X/LMn8rLJJaQFQI9nLMmlc29DV/jbbdhFkpgPxwGENRPapVlwcqFLXX1jb
         zZvYjS3qXrBZx0gwrUojDz5BPGRcmlfr8h14ZGxX7p30hoWFt+mocP+h+cV0mq4hakuv
         eZkZ6Pmz9drObPvkYSRZu4peYkGxfI4mxJmbScfUoPjuiHgTw+Dh8oG9xIWcCx3nj39I
         l3bmDMrrEtC75DN3zpXDEDIOXzL5xeE9Qu4a7FUWmXv23rTrJyAEvvjlTmrMdkXqfKt+
         tIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724087327; x=1724692127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NtlTKJbHiAYCUCklHDfN5OAWyNL6/u/SANPFYo6wU2s=;
        b=nZYPn278plcM8BeluHGRqEdem7fRoMYJxszMWYqfbTolSNMJO+LdvPyZ4ZwfSOkRO/
         9aWlRUSkYXlVeuzXJcTPFEYWd9N5rGskB9Nirip1MZ2mYOR4xlx8sESes93tDtw4KIRV
         h6YUUTf59Wyx7AbAufRyLDmFtTNzHXb5lcJIsOiSdHxkMvG4Jvwc7u0cwHYTZFXWbMuA
         eLNNL5kocbPG4ItXDZ6jMJ98selenB7tdstPq6FkI2qogpMa2/LECR6d78nGAhfO3HFV
         XFkuESMzLLzqpjARZq/Wj0jmRKJ1cNmDsONE1MX3S9YZqHyBB/DEm1zB4J6v3mcs5+Dh
         nFCA==
X-Forwarded-Encrypted: i=1; AJvYcCXUY5m/8HhVonUOwWl+tOXHwhiqVfmr2NB3jp1a0GFK0IK0K8S7MeOYgFta1I0wzWyWlBGPYsbIsT89sSmbQueBQ3XYfY0hWQMUUXjF3Ly+B6pdPZcddYvXbr56zcaxYVFuGHcmb7TM7gpXcWSwq6gm23wNVo8Llsa3v6TCgGVmPoWVE5WildnkcuBy
X-Gm-Message-State: AOJu0Yx5q2NgYzfWJm9kNo3tANejo8foh4E+1uxdWXo7oitAjTgLJvoM
	hgOTUlU4U3c4Fp0FpgVCneVQHKiMClEVu+cSezn9pO6yKsw51IL0
X-Google-Smtp-Source: AGHT+IF+l6vi5FOKP4VXOxBu7lde1hnkECw+FYl/OVHJiwNF1JWFfYs64lSRDMynZsfZ1XvndqKSNA==
X-Received: by 2002:a05:6e02:20cb:b0:39d:4d2d:d0de with SMTP id e9e14a558f8ab-39d56dd773emr2796445ab.3.1724087326948;
        Mon, 19 Aug 2024 10:08:46 -0700 (PDT)
Received: from earth.localnet (97-127-48-199.mpls.qwest.net. [97.127.48.199])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ccd6e97f0esm3234711173.65.2024.08.19.10.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 10:08:46 -0700 (PDT)
Sender: Jeremy <jeremypeper@gmail.com>
From: jeremy@jeremypeper.com
To: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>
Cc: "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>,
 Richard Earnshaw <richard.earnshaw@arm.com>,
 Richard Sandiford <richard.sandiford@arm.com>,
 Ramana Radhakrishnan <ramanara@nvidia.com>, Nicolas Pitre <nico@fluxnic.net>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mark Brown <broonie@kernel.org>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Nikita Shubin <nikita.shubin@maquefel.me>, linux-samsung-soc@vger.kernel.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>, debian-arm@lists.debian.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [RFC} arm architecture board/feature deprecation timeline
Date: Mon, 19 Aug 2024 12:08:43 -0500
Message-ID: <2668591.ElGaqSPkdT@earth>
In-Reply-To: <a6316f7c-4064-4145-aa6a-d34197a3981a@lunn.ch>
References:
 <2831c5a6-cfbf-4fe0-b51c-0396e5b0aeb7@app.fastmail.com>
 <a8c009b5-ada0-4f78-92f7-7a6c5075ccf1@app.fastmail.com>
 <a6316f7c-4064-4145-aa6a-d34197a3981a@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, August 19, 2024 9:23:16 AM CDT Andrew Lunn wrote:
> On Mon, Aug 19, 2024 at 04:12:10PM +0200, Arnd Bergmann wrote:
> > Two small additions:
> > 
> > On Mon, Aug 19, 2024, at 11:17, Arnd Bergmann wrote:
> > > On Thu, Aug 15, 2024, at 21:53, jeremy@jeremypeper.com wrote:
> > > I expect that the terastation pro2 is going to be fairly easy to
> > > convert to DT as there is already support for similar Orion5x
> > > machines. In this case I would just remove all the Orion5x board
> > > files and you can add a dts file later on. The bit I'm unsure
> > > about here is legacy PCI support. I see that the board file enables
> > > both PCI and PCIe, but I don't know if both are actually used,
> > > or if everything is on PCIe.
> > > 
> > > I have some old patches for separating orion legacy PCI from
> > > PCIe support, as only the latter has a modern driver (shared
> > > with kirkwood and armadaxp). If you can confirm that the machine
> > > actually uses PCI, I can dig those out from my backups.
> > 
> > I did find this myself later, the machine does use an on-board
> > PCI connected SATA controller, which is obviously required to
> > make the machine useful.
> > 
> > Doing a PCI host bridge driver with DT support correctly is
> > a lot of work, especially if there is only a single machine
> > using it. Since this uses the same drivers/ata/sata-mv.c
> > driver as the other orion/kirkwood machines, I wonder if we
> > can just pretend that this is a platform device and skip
> > all of the PCI probing. I think this only needs a few
> > small changes to the sata-mv.c driver, but it does require
> > that the PCI bus is left in a known state by the boot loader.
> 
> It is a long time since i looked at Orion, so i could be wrong....
> 
> As far as i remember, it has a PCI controller and a PCIe
> controller. They are slightly different. The PCIe part is i think
> simpler to support, it follows the standards better. I _think_ the PCI
> controller uses a GPIO for interrupt support, which causes a mess.
> 
> If only PCIe is needed, it should not be too hard to make work. I
> would try to avoid the PCI controller is possible.
> 
>       Andrew

Looking at the ts2pro I think it's PCI rather than PCIe but I'm not certain:

0001:01:07.0 SCSI storage controller: Marvell Technology Group Ltd. 88SX6042 
PCI-X 4-Port SATA-II (rev 02)
        Subsystem: Marvell Technology Group Ltd. 88SX6042 PCI-X 4-Port SATA-II
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr+ 
Stepping- SERR+ FastB2B+ DisINTx-
        Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR- INTx-
        Latency: 128, Cache Line Size: 32 bytes
        Interrupt: pin A routed to IRQ 44
        Region 0: Memory at e8000000 (64-bit, non-prefetchable) [size=1M]
        Region 2: I/O ports at 10000 [size=256]
        Capabilities: [40] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA 
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
                Address: 0000000000000000  Data: 0000
        Capabilities: [60] PCI-X non-bridge device
                Command: DPERE- ERO- RBC=512 OST=4
                Status: Dev=01:07.0 64bit+ 133MHz+ SCD- USC- DC=simple 
DMMRBC=512 DMOST=4 DMCRS=8 RSCEM- 266MHz- 533MHz-
        Kernel driver in use: sata_mv

root@ts2pro:~# dmesg | grep -i pcie
root@ts2pro:~# dmesg | grep -i pci | head
[   25.598898] PCI host bridge to bus 0000:00
[   25.598924] pci_bus 0000:00: root bus resource [mem 0xe0000000-0xe7ffffff]
[   25.598963] pci_bus 0000:00: root bus resource [io  0x1000-0xffff]
[   25.598993] pci_bus 0000:00: No busn resource found for root bus, will use 
[bus 00-ff]
[   25.599019] pci_bus 0000:00: scanning bus
[   25.599082] pci 0000:00:00.0: [11ab:5281] type 00 class 0x058000
[   25.599127] pci 0000:00:00.0: reg 0x10: [mem 0xf1000000-0xf10fffff 64bit 
pref]
[   25.599166] pci 0000:00:00.0: reg 0x18: [mem 0x00000000-0x07ffffff]
[   25.599687] pci_bus 0000:00: fixups for bus
[   25.599711] PCI: bus0: Fast back to back transfers disabled



