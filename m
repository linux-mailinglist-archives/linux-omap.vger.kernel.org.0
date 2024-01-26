Return-Path: <linux-omap+bounces-397-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F3B83E37E
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jan 2024 21:53:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFFD31F2525A
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jan 2024 20:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D193423769;
	Fri, 26 Jan 2024 20:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="MTSe6b50"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CCC1CA9C
	for <linux-omap@vger.kernel.org>; Fri, 26 Jan 2024 20:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706302412; cv=none; b=D2iJqursjomi2ase3vh/1ADon8v9wfygx2cYkV5UeP1SK7s/lUGtrwzB3zv8RGtkN+ifmZgCJKmDttEmxKahdG9LYD8glGtwh4/lp/EeWJlvsAsWQhoEgmLUJsd6Z03vpsyyWJhYcagPhkH/JWGCilOHiuJLYn8ipxdK8wLbgSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706302412; c=relaxed/simple;
	bh=VLoOOXLmRcAViCqdEumyZ0WM+FOtsjsH3wWNyhIyX2c=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=MSOaDGy3HRZNUaVatBLP7b91u3WcF1B2YAzkhHjQy7Ga/PtQXjXakLaL7TZQ0wZLuMMzpbpljfmS9xORfwZ1zsYVPTO1d/12S9Ss4bR6DfxoawUgCgP7o8LRHgQ8VK93Kk7Dsshmu0btVvJVBgDBD4pFzgLMcRrHPRI5H/VpvI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=MTSe6b50; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-40eac352733so15133475e9.0
        for <linux-omap@vger.kernel.org>; Fri, 26 Jan 2024 12:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706302406; x=1706907206; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTN5Ayd0inS6Mi17eWodjs4fIbqkRVTBLRu7biaSWLY=;
        b=MTSe6b50I4KNG/vWYUxGS8SSL2gDku64f3GUCtQQ+CiDXl7C5uhJYLU5gHxFfB1YSp
         0hXKBk8Qjo0K0UWd8CnenOWnERJs1cxQkJ9d8fuzfiPnGoGY4wFLeZToDCP4i4lVqUrT
         nTzQ1ZGX79n7AUo7koUhRdWtfdFhxuWG9iSqYIyyoQ08u6uHk5qG0+iGxV95eMGSRCyx
         v+ZQS54m+ltWMLAUQl7/jFo8eAROxD8zOru3cnCs5m1pdbCpKW6zeSJJoHKYQ4vytmAN
         T0Fg6bYVPLG1gYBHnNe22sEGBVANISz09PXoTMjQVJV5FiVjlrPOY2MhFSzb5zUfUy4b
         hb8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706302406; x=1706907206;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iTN5Ayd0inS6Mi17eWodjs4fIbqkRVTBLRu7biaSWLY=;
        b=WYX9gda2pWEM8qHEuS7ZlnO0tu8XQpkVylMNyEx/FYnGBgi8p8K4me53xY2k9TmoSY
         cxDkSGTfZT93X4+a0neDT9hqSy92FslTYKE2T5uou1IUGR6sNCcYzY87aJU6xuZsyMJC
         XRwv7rfh1Be1n5Px1Qs+LTuIwav0o1l1Xzd9bILr15Iwti/77LhMVdbWkt/Cj3HBbZ3/
         A/pY+CBLPjs6HKROdNi6QPjn8K8+9IxmudLDW59kJTG5pzsJcQetNrwB1Ks0COruUf+W
         hDjxyeEdYR/3rn2ebjGh2es6s9kQ9HqSBdidneDp/b1tSyDZLjW7jiv718dmWpcYrlqz
         mwlA==
X-Gm-Message-State: AOJu0YyPzqGbovXw3iis+b2yF0lWzRPK2xPIRtTL265P3dBp9ajmr85d
	gwWM0nhESx06TYhW9NFIyS8bGzmnynseYmS8MMEIZ9NBBlHrsHp5RP1bNEMOkTKdHGaWiR801XL
	I
X-Google-Smtp-Source: AGHT+IEqxlgGZAu08yWGbvkSlARfNVPcAtVqQsOOv9FvxvPNb2GeW6iRwp1/k8TSg0bazFFKtxRnUw==
X-Received: by 2002:a05:600c:2189:b0:40d:9238:df50 with SMTP id e9-20020a05600c218900b0040d9238df50mr283819wme.81.1706302406567;
        Fri, 26 Jan 2024 12:53:26 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31? (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id w18-20020a05600c475200b0040e9f7308f4sm2833071wmo.10.2024.01.26.12.53.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 12:53:26 -0800 (PST)
Message-ID: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
Date: Fri, 26 Jan 2024 21:53:24 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr, en-US
To: Linux-OMAP <linux-omap@vger.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, Nishanth Menon <nm@ti.com>
From: Romain Naour <romain.naour@smile.fr>
Subject: sdhci-omap: issues with PM features since 5.16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I'm upgrading the kernel from 5.10.168 to 6.1.69 (both from TI tree) on a custom
board based on a AM574x SoC and I noticed a regression on the sdhci-omap driver.

The emmc was working on the 5.10 kernel using mmc-hs200 powered at 1,8v (mmc2).

The first sign of the issue is a cache flush error during the first boot:

mmc1: cache flush error -110 (ETIMEDOUT)
mmc1: error -110 doing aggressive suspend

followed by I/O errors produced by fdisk -l /dev/mmcblk1boot1:

I/O error, dev mmcblk1boot0, sector 64384 op 0x0:(READ) flags 0x80700 phys_seg 1
prio class 2
I/O error, dev mmcblk1boot1, sector 64384 op 0x0:(READ) flags 0x80700 phys_seg 1
prio class 2
I/O error, dev mmcblk1boot1, sector 64384 op 0x0:(READ) flags 0x0 phys_seg 1
prio class 2
Buffer I/O error on dev mmcblk1boot1, logical block 8048, async page read
I/O error, dev mmcblk1boot0, sector 64384 op 0x0:(READ) flags 0x0 phys_seg 1
prio class 2
Buffer I/O error on dev mmcblk1boot0, logical block 8048, async page read

Here is what I had as mmc infos on 5.10 kernel:

# cat /sys/kernel/debug/mmc0/ios
clock:		50000000 Hz
vdd:		21 (3.3 ~ 3.4 V)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	2 (on)
bus width:	2 (4 bits)
timing spec:	2 (sd high-speed)
signal voltage:	0 (3.30 V)
driver type:	0 (driver type B)

# cat /sys/kernel/debug/mmc1/ios
clock:		192000000 Hz
vdd:		7 (1.65 - 1.95 V)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	2 (on)
bus width:	3 (8 bits)
timing spec:	9 (mmc HS200)
signal voltage:	1 (1.80 V)
driver type:	0 (driver type B)

Now with 6.1:

# cat /sys/kernel/debug/mmc0/ios
clock:		0 Hz
vdd:		0 (invalid)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	0 (off)
bus width:	0 (1 bits)
timing spec:	0 (legacy)
signal voltage:	0 (3.30 V)
driver type:	0 (driver type B)


# cat /sys/kernel/debug/mmc1/ios
clock:		0 Hz
vdd:		0 (invalid)
bus mode:	2 (push-pull)
chip select:	0 (don't care)
power mode:	0 (off)
bus width:	0 (1 bits)
timing spec:	0 (legacy)
signal voltage:	1 (1.80 V)
driver type:	0 (driver type B)

I'm able to reproduce on the IDK574x evaluation board (where the emmc is powered
at 3v3) with vanilla kernels.

I had to revert all commits related to "PM runtime functions" [1] and "card
power off and enable aggressive PM" [2] from kernel 5.16 to use the emmc again
on both boards.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f433e8aac6b94218394c6e7b80bb89e4e79c9549
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442

Best regards,
Romain

