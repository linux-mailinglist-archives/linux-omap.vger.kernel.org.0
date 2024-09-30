Return-Path: <linux-omap+bounces-2266-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850F98A930
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 17:55:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC697B234D5
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 15:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0812D192B6D;
	Mon, 30 Sep 2024 15:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2bLsCBx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3FD1925A0;
	Mon, 30 Sep 2024 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727711439; cv=none; b=oe23RAyIsV4BT61wZWiLhELLO76BdWy2qUdElTdjhl7a1VNkWq5ubW58+UYfGG2SwvcLL/v5PzaIIHODxGQL64iXc1/XzAATeEp6Y27jb/PPJ2lPlM27q5O/9f00vSoIamcRGKTCv8O3GIXVty0PrIE9Jntb3K07t1ZfgMlbYXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727711439; c=relaxed/simple;
	bh=ES7/cNL+8F5BG1CtVymfGnbcn65kDxPtYwD9CbnCd5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cILJ4zdbFOefS3BI5SqBvgA0bJyiIhWsBKHdIKopxQshnPmSjgCgzVWZleQ50kdanjxySsi81q9CwdzTW8MBYtC1gpiitgoHUldSRnzD1J8DyUUQpTMjFuVEY38ycGyMRTltMf99on9AyG2B+D7C8AblNHI8wlcMVIgh/afs08Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e2bLsCBx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED50C4CEC7;
	Mon, 30 Sep 2024 15:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727711439;
	bh=ES7/cNL+8F5BG1CtVymfGnbcn65kDxPtYwD9CbnCd5c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e2bLsCBxW1jEHWd5+44XmJUD3AHQ2zOEAsLgA9A6LskxEMOowGESItyh8VYJPmu9d
	 4jtB8gDUOQhNudfCQcCI15lTPrZATkdkNPcc4HlIexn5wLnqb4XDsEfkUXN4Du/ku+
	 1iefp1ReVfxyYVwFsZHa7IIP1FnLmghOG5VTf7KLYOphI/vUx9abGstjIY2bbDhk5o
	 6LHop8I9uh6QrW5R+pncVm+qEQ/aCPSBfmLUL4zCUYs9gvh/5Iuz6jAplMsJqfvr66
	 R8BUpjwOdlznoWtukNYQkEW+ghfypUeEn4MGVwmDgk/jqmKAeGrt+ScoPNSAQKUlp5
	 ghkLdpR3nWuaA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, daniel.thompson@linaro.org, jingoohan1@gmail.com, 
 deller@gmx.de, bonbons@linux-vserver.org, jikos@kernel.org, 
 bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 shawnguo@kernel.org, festevam@gmail.com, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>
References: <20240906075439.98476-1-tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/28] backlight: lcd: Remove fbdev dependencies
Message-Id: <172771143528.575091.11206670761762692386.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 16:50:35 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 06 Sep 2024 09:52:14 +0200, Thomas Zimmermann wrote:
> This series removes most dependencies on fbdev from the lcd subsystem
> and its drivers.
> 
> Patches 1 to 3 rework the fbdev notifier, the fbdev's fb_info can
> now refer to a dedicated lcd device, and lcd defines constants for
> power states. These changes resemble similar changes to the backlight
> code.
> 
> [...]

Applied, thanks!

[01/28] backlight: lcd: Rearrange code in fb_notifier_callback()
        commit: d36870367c187daaa8a2c487d5ff1d57141eb039
[02/28] backlight: lcd: Test against struct fb_info.lcd_dev
        commit: 26228256b796eb0145bdfb2ae34ec8c4c0ef1319
[03/28] backlight: lcd: Add LCD_POWER_ constants for power states
        commit: 48ffe2074c2864ab64ee2004e7ebf3d6a6730fbf
[04/28] backlight: corgi_lcd: Use lcd power constants
        commit: 20929e3691599f9cb3e3a0a7b81718c7a5b716b9
[05/28] backlight: hx8357: Use lcd power constants
        commit: 7629628d610658f9cc210b9e969f34d07f2c85bd
[06/28] backlight: ili922x: Use lcd power constants
        commit: 4364900b128801d62f9c42b2486bceda82f95b17
[07/28] backlight: ili9320: Use lcd power constants
        commit: e844452282f7dba399b86bf9847294c226c8d466
[08/28] backlight: jornada720_lcd: Include <linux/io.h> for IOMEM() macro
        commit: a412a18709fd40356a1768c7522db97cb05062d1
[09/28] backlight: jornada720_lcd: Use lcd power constants
        commit: 992f5c43fcf26001c1f5a11146be3c4c1533bbcf
[10/28] backlight: l4f00242t03: Use lcd power constants
        commit: 4be0de90b7f8816e4a310ec6b2183eee66d54290
[11/28] backlight: lms283gf05: Use lcd power constants
        commit: 3b53bf14d4eef8293bf0f826f3345090f4557516
[12/28] backlight: lms501kf03: Remove unnecessary include of <linux/backlight.h>
        commit: 2576e64bc8a59838e74ba081a3d05ea6ab30678c
[13/28] backlight: lms501kf03: Use lcd power constants
        commit: 7c323fb26465ed294cd34bff77a68a40499148a7
[14/28] backlight: ltv350qv: Use lcd power constants
        commit: a42a215d4d4d5ab32af4dee860e964764ed89f65
[15/28] backlight: otm3225a: Use lcd power constants
        commit: 7c14e7a3fda5bd7323dcee60c69a47773f1fd6c6
[16/28] backlight: platform_lcd: Remove include statement for <linux/backlight.h>
        commit: 516f3251429068a963d498a35441c0afaea6d1a4
[17/28] backlight: platform_lcd: Remove match_fb from struct plat_lcd_data
        commit: c38a7db56d18b3ec07f3ad52c1e3f1f05c375011
[18/28] backlight: platform_lcd: Use lcd power constants
        commit: 86c0826a7eebf476e46fea81ca3a85f355213a9a
[19/28] backlight: tdo24m: Use lcd power constants
        commit: e5dfbbd39ee839ad3d6c1df7b3ec92800ceb4984
[20/28] fbdev: clps711x-fb: Replace check_fb in favor of struct fb_info.lcd_dev
        commit: 36462ac193088db17823b592cb2c08fff6898b23
[21/28] fbdev: clps711x-fb: Use lcd power constants
        commit: c11de820785fc2f1b58a764ac5529ab3670ce8c4
[22/28] fbdev: imxfb: Replace check_fb in favor of struct fb_info.lcd_dev
        commit: 488d807101c208d057c429dd6f9ce00041eda094
[23/28] fbdev: imxfb: Use lcd power constants
        commit: 32c913d82ec70af3103608996dbd32aa92004347
[24/28] fbdev: omap: Use lcd power constants
        commit: 16d6110e5257bb3718c53186765fa04bc8d53000
[25/28] HID: picoLCD: Replace check_fb in favor of struct fb_info.lcd_dev
        commit: 05deb1ce96cda46a1ddc82f82a4645ef14cbe680
[26/28] backlight: lcd: Replace check_fb with controls_device
        commit: 43e1120deb3768c86aa3875c7073658e44a30ea5
[27/28] backlight: lcd: Remove struct fb_videomode from set_mode callback
        commit: 02e224d096ef58fe59e96609de6018e133f33512
[28/28] backlight: lcd: Do not include <linux/fb.h> in lcd header
        commit: 0d580d99749e759b62dc8e28f511310e9235da7a

--
Lee Jones [李琼斯]


