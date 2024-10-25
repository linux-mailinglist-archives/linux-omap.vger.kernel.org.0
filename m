Return-Path: <linux-omap+bounces-2485-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4127D9AFD6E
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 10:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05BA2280102
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 08:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C42E1D4159;
	Fri, 25 Oct 2024 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc+X+KwG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B79F1C174E;
	Fri, 25 Oct 2024 08:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846768; cv=none; b=A3L/Cive2BiI+X3R3Ikh9sY74EpO7lcSG5iw+mMA0JjdEzQ0utH1yoyFCcc7UzModspvV/yNPIHD36JnS9qSZZ4cm0PswQWPztIVJfYeIdQZb+d78chE1t5FjIaKFS/Vq+c1vVyzO9uA4BxmL2YYYC7BejmCzkd1iR+3e6TlIps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846768; c=relaxed/simple;
	bh=CaoZb6iMKefryx3dzMfNqk04kR4xgtLkasn22NSbL9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+YuQ3zi1ozPc6/d76JQ6az4T0EurBg5+V7hHbE1dSelIocrwQQAHnNat6mvNOFo8LzH5sDKq8gQlZ4LJoJVeZbpug7EKeWdsNvKWQl78/QziTcC3sC4EUwbIhgqTMdCu9zG2e+bDpav5Dzq7KtiMxfHH829xKAI6Ry8yTmy+bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc+X+KwG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5468BC4CEC3;
	Fri, 25 Oct 2024 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729846768;
	bh=CaoZb6iMKefryx3dzMfNqk04kR4xgtLkasn22NSbL9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tc+X+KwGPFtij/lPh0fHrtgfA2ROCdFZghtamGl4k8h6+Oij9QU4PEUoDcFW1tYDW
	 0D17kj74E0y6P/WfttqKt2HQcgOcD+jvUm7glnmwM9Fgg6ebKftRHJHl8pY8U1k/Ga
	 eIORbzLiYWyZXDSp4Klt7U2x2JErz3meyVBr6yyftFHdEixXJFdSY8eaPjd4x5y1SQ
	 IEneXeSm8vJqM5k49AgH4QJJtsezk8hhUeFNWDTcJy2vngIR1XW/qDZvbVRzEc1LI3
	 Xmq4CkAY9GplgES+ydyHW5pYhtiVca8ux8sAoivEtasrgXuOpzzCGw9BTZdiZ49D9O
	 09HZT7LdFMTBw==
Date: Fri, 25 Oct 2024 09:59:22 +0100
From: Lee Jones <lee@kernel.org>
To: Jiri Kosina <jikos@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, daniel.thompson@linaro.org,
	jingoohan1@gmail.com, deller@gmx.de, bonbons@linux-vserver.org,
	bentiss@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	shawnguo@kernel.org, festevam@gmail.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between Backlight, HID and fbdev due
 for the v6.13 merge window
Message-ID: <20241025085922.GE10824@google.com>
References: <20240906075439.98476-1-tzimmermann@suse.de>
 <20241001085540.GB7504@google.com>
 <nycvar.YFH.7.76.2410211750460.20286@cbobk.fhfr.pm>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <nycvar.YFH.7.76.2410211750460.20286@cbobk.fhfr.pm>

On Mon, 21 Oct 2024, Jiri Kosina wrote:

> On Tue, 1 Oct 2024, Lee Jones wrote:
> 
> > Enjoy!
> > 
> > The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> > 
> >   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> > 
> > are available in the Git repository at:
> > 
> >   ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/ib-backlight-hid-fbdev-v6.13
> > 
> > for you to fetch changes up to 0d580d99749e759b62dc8e28f511310e9235da7a:
> > 
> >   backlight: lcd: Do not include <linux/fb.h> in lcd header (2024-09-30 16:49:42 +0100)
> > 
> > ----------------------------------------------------------------
> > Immutable branch between Backlight, HID and fbdev due for the v6.13 merge window
> 
> As picoLCD is the only affected driver in HID, I will be pulling this only 
> if there are any patches for picoLCD submitted for 6.13 (which is not yet 
> the case).

Sounds like a plan.  Thanks for letting me know.

-- 
Lee Jones [李琼斯]

