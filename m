Return-Path: <linux-omap+bounces-2283-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA498B7AA
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2024 10:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40A4FB25519
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2024 08:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B58A19D09B;
	Tue,  1 Oct 2024 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwFhJk+s"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3199619ABA4;
	Tue,  1 Oct 2024 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727772946; cv=none; b=p8g/nGnqvapgzb6l33n73c7sgW2pgRUkw+YSgevXeQ1I+Wpcs08jCYOAHbf3q+DnlKa0vOt8MxBWOZKh1xovdIiux46g7mzWjLDQ5WS28QJIfH666BKUe1Pn7DJBikLslHMc78PIE8fjWM7svnlpf38+8KRxoHlrJjo9hyUwx7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727772946; c=relaxed/simple;
	bh=siQymRtTEPsEGx0zx5SfKOjAhstZARHZrhU+kftc6MY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u1w8FtlVW0D29fDmXGUIajV/o+2ls0p4Y65hwt+syLUMQImZ36O+TMKB1zfDP8ekFmgk/kLJyYfDRi5gCuEs/sAXAPPJtAw70n3tCzPHkQGuk1nG15GrZf7eHzbmPPHqX2PyWZfDQ8QL8+06WXPDPcLCjBLL2VQI16iqPkV46IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwFhJk+s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA2FC4CEC6;
	Tue,  1 Oct 2024 08:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727772945;
	bh=siQymRtTEPsEGx0zx5SfKOjAhstZARHZrhU+kftc6MY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JwFhJk+sjQKWUycH6f0aBhWp2rS2iox+HT/Sa5IrFg/E83F6Eu2SDFYcfPL6jVd10
	 w6NthvnCgowaK2m4UvXVyrgOsnds874xOUOz+Z8T47XRYJTX6mBYzTaayv2Sbmij1M
	 WVysM+/702SKhCpqV2aaS19We5jVT8JOdwgspps75qYRAQe49N4wQkkuPkQeM5JhXJ
	 NLziFK+eLDL9sev+sORcCu5IyaNsyXGzGGSBdsoWxmqOj3uVNRPbNGAT7GtrN7U+s2
	 F0sTfKAA2u9vMZ2NdqZzLlY6XeUdKcoJkr3NWT7N1v2t8xYrxa9uuGW3nw0jW6BX+z
	 MFN7qkhP4w59Q==
Date: Tue, 1 Oct 2024 09:55:40 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
	bonbons@linux-vserver.org, jikos@kernel.org, bentiss@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
	festevam@gmail.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [GIT PULL] Immutable branch between Backlight, HID and fbdev due for
 the v6.13 merge window
Message-ID: <20241001085540.GB7504@google.com>
References: <20240906075439.98476-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240906075439.98476-1-tzimmermann@suse.de>

Enjoy!

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/ib-backlight-hid-fbdev-v6.13

for you to fetch changes up to 0d580d99749e759b62dc8e28f511310e9235da7a:

  backlight: lcd: Do not include <linux/fb.h> in lcd header (2024-09-30 16:49:42 +0100)

----------------------------------------------------------------
Immutable branch between Backlight, HID and fbdev due for the v6.13 merge window

----------------------------------------------------------------
Thomas Zimmermann (28):
      backlight: lcd: Rearrange code in fb_notifier_callback()
      backlight: lcd: Test against struct fb_info.lcd_dev
      backlight: lcd: Add LCD_POWER_ constants for power states
      backlight: corgi_lcd: Use lcd power constants
      backlight: hx8357: Use lcd power constants
      backlight: ili922x: Use lcd power constants
      backlight: ili9320: Use lcd power constants
      backlight: jornada720_lcd: Include <linux/io.h> for IOMEM() macro
      backlight: jornada720_lcd: Use lcd power constants
      backlight: l4f00242t03: Use lcd power constants
      backlight: lms283gf05: Use lcd power constants
      backlight: lms501kf03: Remove unnecessary include of <linux/backlight.h>
      backlight: lms501kf03: Use lcd power constants
      backlight: ltv350qv: Use lcd power constants
      backlight: otm3225a: Use lcd power constants
      backlight: platform_lcd: Remove include statement for <linux/backlight.h>
      backlight: platform_lcd: Remove match_fb from struct plat_lcd_data
      backlight: platform_lcd: Use lcd power constants
      backlight: tdo24m: Use lcd power constants
      fbdev: clps711x-fb: Replace check_fb in favor of struct fb_info.lcd_dev
      fbdev: clps711x-fb: Use lcd power constants
      fbdev: imxfb: Replace check_fb in favor of struct fb_info.lcd_dev
      fbdev: imxfb: Use lcd power constants
      fbdev: omap: Use lcd power constants
      HID: picoLCD: Replace check_fb in favor of struct fb_info.lcd_dev
      backlight: lcd: Replace check_fb with controls_device
      backlight: lcd: Remove struct fb_videomode from set_mode callback
      backlight: lcd: Do not include <linux/fb.h> in lcd header

 drivers/hid/hid-picolcd_fb.c             |  4 +++
 drivers/hid/hid-picolcd_lcd.c            |  6 ----
 drivers/video/backlight/corgi_lcd.c      | 17 +++++------
 drivers/video/backlight/hx8357.c         |  2 +-
 drivers/video/backlight/ili922x.c        |  7 ++---
 drivers/video/backlight/ili9320.c        | 15 +++++-----
 drivers/video/backlight/jornada720_lcd.c | 10 +++----
 drivers/video/backlight/l4f00242t03.c    | 32 ++++++++++----------
 drivers/video/backlight/lcd.c            | 50 ++++++++++++++++++++++++--------
 drivers/video/backlight/lms283gf05.c     |  2 +-
 drivers/video/backlight/lms501kf03.c     | 24 +++++++--------
 drivers/video/backlight/ltv350qv.c       | 15 +++++-----
 drivers/video/backlight/otm3225a.c       |  2 +-
 drivers/video/backlight/platform_lcd.c   | 20 +++++--------
 drivers/video/backlight/tdo24m.c         | 19 ++++++------
 drivers/video/fbdev/clps711x-fb.c        | 29 +++++++++---------
 drivers/video/fbdev/imxfb.c              | 32 +++++++-------------
 drivers/video/fbdev/omap/lcd_ams_delta.c |  8 ++---
 include/linux/fb.h                       | 13 +++++++++
 include/linux/lcd.h                      | 29 +++++++++++++-----
 include/video/platform_lcd.h             |  3 --
 21 files changed, 181 insertions(+), 158 deletions(-)

-- 
Lee Jones [李琼斯]

