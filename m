Return-Path: <linux-omap+bounces-1512-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2404902020
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2024 13:08:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 049D7B23A46
	for <lists+linux-omap@lfdr.de>; Mon, 10 Jun 2024 11:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57A8F79DC7;
	Mon, 10 Jun 2024 11:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="bfXjSljj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0480FC01
	for <linux-omap@vger.kernel.org>; Mon, 10 Jun 2024 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718017697; cv=none; b=G+5pCEMpGVBnbTdcwHXsApiqSuXKcC4Xd045fEGSKDpeXtX8IWlGAKfTz9AXl6QwJ4PwSL6icKP1Zgy2pH1gs3+04faSA5fnm7BX5VrfguwUAeRqEz8SUDS70GQG3n91F7J9cDYEDxnBPpzBCuLt6pgEIcFERoaoYfYq3mI2I3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718017697; c=relaxed/simple;
	bh=4wXAELHKHysP/5Fihbq9h7r8WXzlVFit1ndvFteCKk8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=InQ78Cz3xoRChlKYDbowb5/GRXoIPnaJZbDKu4w9oPoXS6bfY/NPO6/zpCbFesSAQB7MQkkg0A9HgZO98nErhnEuu6+pTsSozUyI4POP4ipavPslZQxvhZOIjhmJEkhJwq6BaqqX1C9Txn05zKxahpfyl00hhvcLC5Cq0fx8kx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=bfXjSljj; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so4398501fa.2
        for <linux-omap@vger.kernel.org>; Mon, 10 Jun 2024 04:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1718017691; x=1718622491; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wXAELHKHysP/5Fihbq9h7r8WXzlVFit1ndvFteCKk8=;
        b=bfXjSljjAQ02wPzAH75HlSPp1rg2CsBvSuZHDOGR8ZzrzD622jwQ8xiWormjk2ePWs
         csHjLHXrzNVd5zex5XKcNzZbDJWST2GWzGx4KQl5YAs1DUT6e4+Dp25fkuIK8P41OrrD
         Nue0e50JxmZCdIUJEXm1xPoIZ0Cr0LGpftmqihwrGWM99LR9sYIna+7NVb7Zkvw9Ksbp
         e0G7LmLyNrlUa3fmesVJyf5WlsNL8yPi2XdxkMo06BysegDIVQ6OYa+DafXOw9uBdBR1
         ZHqw3fZ6Mk+A+lhSD1jvC+SzZsp23/bzSdOomUJFvq3iFNiaHJoweA9kjvT4oCac4M86
         7Z9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718017691; x=1718622491;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4wXAELHKHysP/5Fihbq9h7r8WXzlVFit1ndvFteCKk8=;
        b=wKddGZwpOrBERDpn/Y0Fl0X7rz/yUMkXnZzCVbxZKA63EsjjE0oDStSNgW4tpK639b
         LGxLgHwz/DySHQRZRYPVwy5mr4tGzQAfone3HQemOSIc9N6z6KMFzT0Fh53lE8TUORXu
         wZDFF7Jxr8A2T8wayU/VeiOrJ8XE9XSn3Of81rrCpIyeGTY46vKYhxfHKh3lZP+/iend
         A9thp9O9DCnvJXYhG2U8r66DoNSpkMrt22RBOBz2TxDREkpzlhaAotOwW+1aN9BmWokZ
         3KnavuLb2F/n201N5nXUDYgyqU803maGiZG1P1dEgxYdkhwrcZlJq0s1pDE6vGhX+mLc
         I6og==
X-Gm-Message-State: AOJu0YwdNuNMTTMYr/ZkHx2JdlERWo/eOO6udrqd46s01d33Rly3qDGb
	YtWt9jQFki1azdUO3KSbHC3CLL0ifF5ZsqTqYci7wgxOld/vKVEGLz1ilU/eu7zIcLomYmqoBvZ
	6
X-Google-Smtp-Source: AGHT+IEPP66+bNJIpLBO7YrCfiT0ugC49fATUw4JUS7ma9pPeGwUW6vRT5cGtyNwNEA+NntYpU7xZQ==
X-Received: by 2002:a2e:8ec3:0:b0:2ea:e3b4:d50f with SMTP id 38308e7fff4ca-2eae3b4d664mr40454171fa.9.1718017691495;
        Mon, 10 Jun 2024 04:08:11 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6f96c37b6sm37626745ad.231.2024.06.10.04.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 04:08:11 -0700 (PDT)
Message-ID: <4b1e0da5-5600-47f0-b510-a284fe943a67@sigma-star.at>
Date: Mon, 10 Jun 2024 13:08:05 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-omap@vger.kernel.org
Cc: Richard Weinberger <richard@sigma-star.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: AM572x based board hangs in PCIe probe with 6.6.16 stable kernel
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to get a mainline 6.6.16 stable tree to work on a custom board,
based around a PHYTEC AM57x phyCORE kit SoM.

The board was originally running a 4.19.79 based vendor kernel (PHYTEC tree[0]
plus a few of patches from the board vendor). From the device tree sources,
I guess current mainline supports the SoC, but not this specific SoM?

So far, I tossed out as much unrelated cruft as possible from the vendor patch
set, without breaking the existing config, and then tried to port over what was
left of the device tree changes.

That would be pretty much only *additional* dtsi files for the SoM, board and
a dts file for the board.

The SoC specific stuff, clock configuration, etc... AFAICT all stem from mainline
dra7*/omap4/omap5 dtsi files that are directly or indirectly included.

With PCIe (and the bb2d GPU) disabled, the resulting kernel and device tree boot.
UART, i2c, eMMC, network appear to be working.


If I re-enable PCIe, the system completely freezes during boot. printk debugging
narrowed this down to the probe function of the driver,
drivers/pci/controller/dwc/pci-dra7xx.c:799, inside the first readl(), where
the driver attempts to access PCIECTRL_DRA7XX_CONF_DEVICE_CMD

 From the boot log, the PCIe PHYs appear to probe and initialize successfully,
well before probing PCIe is attempted.

I suspect maybe some clock or power dependencies might be missing? But as said,
the SoC specific configuration is pretty much as-is from the mainline tree.

The board specific dtsi file only enables the PCIe RC node (defined in
dra7.dtsi) and assigning a GPIO pin. From what I can tell, other boards using
the same SoC follow a similar pattern (e.g. looking at the beagle-x15
device tree source for comparison).

Is there some known issue regarding this SoM, PCIe controller, or most likely,
something obvious that I am missing? Any pointers what I should be looking into?

Thanks,

David


[0] https://stash.phytec.com/projects/PUB/repos/linux-phytec-ti/browse?at=refs%2Fheads%2Fv4.19.79-phy

