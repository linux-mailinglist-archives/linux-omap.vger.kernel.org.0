Return-Path: <linux-omap+bounces-2464-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CAB9A6EC0
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2024 17:51:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2D2C2815B3
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2024 15:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A7BE1CBEA9;
	Mon, 21 Oct 2024 15:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aNfQkTjj"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0367F1A264A;
	Mon, 21 Oct 2024 15:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525894; cv=none; b=Ngx1kmAwu39AkpuR8NC7m4Q6JzxmSv/Kv2XaHCQ/fx0lteftYA/WGnmy7aaRgkiWIlV2jj8AqzIaRACY9UDq8ko7WZ6Klt1scpNIjwg3pGWMZAZviIOgLavGAuAQuIzsHtFryvaf1c4nUTRV2zl0ziDRqR6J2LtjF1YiblqJSro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525894; c=relaxed/simple;
	bh=8/4aoJTzSCYiAzLKs8b+N/pGj2ORTDbiLdb0guRvSRw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HekNNuOxKiBWi4t1Rhjr7iRTarC5HaTVPv/St8Q6Owoqwwqetx7Jj8yHl9sBAN2Z/c/yBES9+qMgdCMIi7W8XwxW8wLDJc2uHPNRR/m52IRuf7oE7TxRYVSpWUFWo1eUmKDKpeTJn4rgg7OfSxEqvElLUL3UGmQsa32Wl0Js4Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aNfQkTjj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B4AC4CECD;
	Mon, 21 Oct 2024 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729525893;
	bh=8/4aoJTzSCYiAzLKs8b+N/pGj2ORTDbiLdb0guRvSRw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aNfQkTjjj/FOVbqBZAXuA2Aoa/2WByOzJCVi4fCuhNQJTSQp/QP6vfI4TNI2xVPfw
	 5bQxFJpAtWtOv2ziazKqVLpiFP/XWkRfZnhzY/sYOe2Cgjn0fDM8htQ535ZXdrtgsf
	 1C6hDLZIXFlo8ojwU7atkdYHEguF5/9E82r64HiupuS3EqiJiyvGtq21sQgrlEB4NI
	 XItQzLIJQtQD2BgSx04ti4HJBcklRtcwJSWO2kGMup+EGas3i8cuzbi3yHip8lW4G7
	 RD3yBTXXW8921faz0rhdWoArUYxVjzE0oEvTwiJStdHrun8uEQ/DaP1k36kn2aq8Po
	 oc1BP2jVp3Vmg==
Date: Mon, 21 Oct 2024 17:51:30 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Lee Jones <lee@kernel.org>
cc: Thomas Zimmermann <tzimmermann@suse.de>, daniel.thompson@linaro.org, 
    jingoohan1@gmail.com, deller@gmx.de, bonbons@linux-vserver.org, 
    bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
    shawnguo@kernel.org, festevam@gmail.com, dri-devel@lists.freedesktop.org, 
    linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between Backlight, HID and fbdev
 due for the v6.13 merge window
In-Reply-To: <20241001085540.GB7504@google.com>
Message-ID: <nycvar.YFH.7.76.2410211750460.20286@cbobk.fhfr.pm>
References: <20240906075439.98476-1-tzimmermann@suse.de> <20241001085540.GB7504@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Oct 2024, Lee Jones wrote:

> Enjoy!
> 
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/ib-backlight-hid-fbdev-v6.13
> 
> for you to fetch changes up to 0d580d99749e759b62dc8e28f511310e9235da7a:
> 
>   backlight: lcd: Do not include <linux/fb.h> in lcd header (2024-09-30 16:49:42 +0100)
> 
> ----------------------------------------------------------------
> Immutable branch between Backlight, HID and fbdev due for the v6.13 merge window

As picoLCD is the only affected driver in HID, I will be pulling this only 
if there are any patches for picoLCD submitted for 6.13 (which is not yet 
the case).

Thanks,

-- 
Jiri Kosina
SUSE Labs


