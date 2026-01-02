Return-Path: <linux-omap+bounces-5306-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500ACED99A
	for <lists+linux-omap@lfdr.de>; Fri, 02 Jan 2026 02:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 616D030046C0
	for <lists+linux-omap@lfdr.de>; Fri,  2 Jan 2026 01:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25AF120F067;
	Fri,  2 Jan 2026 01:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AvEj/0/M"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3594F1C69D
	for <linux-omap@vger.kernel.org>; Fri,  2 Jan 2026 01:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767318920; cv=none; b=SlpT5xxa1u/N5Q3mKZZYJJzfqQYZYnrGztRFcN/xvAX8+rVfQ5Zypn2cnWSZulWK2vxTAQ6gP1A8OFrgC/c3hRtwEPkdc1ObvPOlzxKrSFij928JCwARSHp31IsrXBn4pOYmoKpgrnxypNBlg018qquD13dIjzB/FGHwB2CA2to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767318920; c=relaxed/simple;
	bh=EkLngSquTM1BwBEdY8v/qPAltklK/YaUMxSBuSjVE9I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=eb0Xw0OFm1TpDLKCxwiPFeHEfUhYdB0qJMPUvmg1CPSc2RiTWOAQAAMexvIpQJri88gqQBk+mWy+a1LUIvByEvMK7wQz3FzEukNSOQGrbJz1G4QkhOyqJ+qzGumhByLIzZAxpi/LLcIb6kMA0kqf+CjOJeePHkILdSB1Ha9eAk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AvEj/0/M; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-37fcd0704d5so12592381fa.0
        for <linux-omap@vger.kernel.org>; Thu, 01 Jan 2026 17:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767318917; x=1767923717; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FV2xYISBrc+EHKZMZi2H8bUgE6vMnvLSh5mQjE9RgYg=;
        b=AvEj/0/MEcuHeFh1ehqYr+PfgmwUSvhFAirhXSyateq6+4ZPdZq6fRNSG7ZpaKSvyl
         t4fj6yvXmOPDZucIHdOlK0eEqW0GCI/mQwzDL7c4lSsqMpTnIrnxUNl32o56ed4Lxovr
         icw3Mn2+f9CIUiDoPb6yCmxbLCsAhlUFSS0KcFh8YMYMFlhF8/GMHI93anyRcoOS3nHh
         XoHQ8MJjaKUsmzhFrPbs2ZvC9dnewF6j9bb9gA+MuwQHZVm654KQYUGVMmaM3TgCaTl5
         C7faIejhWTd1KzSMqEqWabc0lSECHG556F3YJFI0BujVgbTbTcIbxQ36dV7IeCuFX2jL
         gL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767318917; x=1767923717;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FV2xYISBrc+EHKZMZi2H8bUgE6vMnvLSh5mQjE9RgYg=;
        b=YDxf43LoJI7D+plD/lBF281iqcqqyI7YAHxLcln6qQ6mXmVvuFHxF68naE6YPQb3XN
         1YDnM+hEySQogV50ICog3NA17dMgRxgkNSwBlSYREj6b6/0vIyY7lBAQkYzDBiwbCxVS
         adujCKy4XRZm97n4Qfs99hH5/EJK5fvImfoQMjKrVodCwwkSgQ/V398xQXY6DhDr6bMg
         YGbAgk4oM5lAoCke4lUL9PoeAvEMN/FgTE20RVd7tYbqPidCWCesEPjCX3jeMb7Vh6gP
         yuen4R3GNF+8MZ9Zo7e/0yjoKTUOGE1xNd2gXsE9wb8nRE7QHOfrTq/oSLr+zlhZZw5I
         sTMQ==
X-Gm-Message-State: AOJu0YyMjZCJRhfkEaUfa2PFtsyMgaNJ73C2f+/5ORP1531w7S9yVdv6
	p3fAJ+meE5QBfXF08dWwh1BV2123Zc5oSNEAvVE3zQihLpbYaRPSHrYPWsfMJYcMaVgNCJQWVg5
	IWCLaPWEpyHgdIPuSzTyH1ADYQ1pP+i8fZ4aU
X-Gm-Gg: AY/fxX5pIDeiJD/xhx7fqHkaM/ZXq7Nfpbd19ENfhNDNZXh3YX3UM/FX3DAD9JWawBH
	Y9UA0CVczJjt0BG0PgkxBjlYgGXXgUBnRJSy8FV3C0+pC2CBvR8ShA6/TlnDUMZudxsv6HVM2gh
	MMXBhREeb3E7VAWSEUjOmxULLgBrBBrrQq8Z6ALuMFh4h02i+U6LchUZIozWZa8cqSJXQUelcge
	kHPooGzuqCh/hn5Arg/8m8K+GmSK2Tb8qGQS78Em8biVFGwYIYjpeo5zRgEYn38xfQJEt1ZkrRb
	XmAi97Q=
X-Google-Smtp-Source: AGHT+IGCF3WDLUUs7QQGucMEi5DrqN1sqrf3y0t/3rIak5e8UtmqWRHbeW4yX0lgnV2ZyERDD/In4uRUGTsHZUxhKbM=
X-Received: by 2002:a2e:bc0f:0:b0:380:a1c:7037 with SMTP id
 38308e7fff4ca-3812152aa0fmr81284481fa.2.1767318917067; Thu, 01 Jan 2026
 17:55:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Krzysztof Lasocki <krz.lasocki@gmail.com>
Date: Fri, 2 Jan 2026 02:55:06 +0100
X-Gm-Features: AQt7F2oNhGsfxnFCcHcO-qraVGDeprCBCOgEKdalt9zh2wwGxF_IPfcZYSLm4u0
Message-ID: <CAMZtjFax=Css04mxz7yzG=diSoE=DcaUcrFipt3d5Qy3KMv+hw@mail.gmail.com>
Subject: dm8148-t410: getting USB to work
To: linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I am trying to build a kernel for HP t410 thin client which is running
a TMS320DM8148. There are some very old (kernel v4.6) instructions
posted on http://muru.com/linux/t410/, and following these I am
getting a kernel that boots, but does not detect any USB
controllers(!). I am using omap2plus defconfig,
linux-omap-drivers-ti-sysc-for-v6.10-signed release, I want to use a
USB drive for the root device, so I set the respective USB Kconfig
items to builtin. The devicetree I'm using is
arch/arm/boot/dts/ti/omap/dm8148-t410.dts
I am getting the following errors related to the USB controller:

[    3.150752] am335x-phy-driver 48141b00.usb-phy: using DT
'/ocp/l4ls@48000000/control@140000/usb-phy@1b00' for 'reset' GPIO
lookup
[    3.162542] of_get_named_gpiod_flags: can't parse 'reset-gpios'
property of node '/ocp/l4ls@48000000/control@140000/usb-phy@1b00[0]'
[    3.174563] of_get_named_gpiod_flags: can't parse 'reset-gpio'
property of node '/ocp/l4ls@48000000/control@140000/usb-phy@1b00[0]'
[    3.186488] am335x-phy-driver 48141b00.usb-phy: using lookup tables
for GPIO lookup
[    3.194201] am335x-phy-driver 48141b00.usb-phy: No GPIO consumer reset found
[    3.201286] am335x-phy-driver 48141b00.usb-phy: using DT
'/ocp/l4ls@48000000/control@140000/usb-phy@1b00' for 'vbus-detect'
GPIO lookup
[    3.213553] of_get_named_gpiod_flags: can't parse
'vbus-detect-gpios' property of node
'/ocp/l4ls@48000000/control@140000/usb-phy@1b00[0]'
[    3.226100] of_get_named_gpiod_flags: can't parse
'vbus-detect-gpio' property of node
'/ocp/l4ls@48000000/control@140000/usb-phy@1b00[0]'
[    3.238542] am335x-phy-driver 48141b00.usb-phy: using lookup tables
for GPIO lookup
[    3.246254] am335x-phy-driver 48141b00.usb-phy: No GPIO consumer
vbus-detect found
[    3.253931] am335x-phy-driver 48141b00.usb-phy: dummy supplies not
allowed for exclusive requests
[    3.262855] am335x-phy-driver 48141b00.usb-phy: dummy supplies not
allowed for exclusive requests

Following code in drivers/usb/phy/phy-am335x.c, the errors come from
the upper-level usb driver, it seems that usb_phy_gen_create_phy
requires a vbus-detect gpio pin. Following the DM8148 Technical
Reference Manual (sprugx8c.pdf) I found that the SoC has these pins
(VDD_USB0_VBUS and VDD_USB1_VBUS), but they are not connected to GPIO.
Resetting the PHY is also done by means of a register and not GPIO
(the PHY is integrated in SoC).

This device operates USB in host-only mode. The USB power regulator is
set up to be always on. Does anyone have an idea how to patch this so
the USB controllers' VBUS_DETECT is considered high and they are
configured and enumerate the devices? Is there some way to specify a
dummy always-high GPIO in the dts?

Best
Chris Lasocki

-- 
Ala ma bota

