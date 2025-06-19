Return-Path: <linux-omap+bounces-3918-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A72AE0A2D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 17:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C89F5165CAD
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 15:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0470F220F2F;
	Thu, 19 Jun 2025 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N526UxVR"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A944215F53;
	Thu, 19 Jun 2025 15:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750346394; cv=none; b=njM6wQhOu2IILsPKMLi6BK9LK1m61krPt3+q+4TsA8BVY3uWDCI6kSIaYJFqTRWa5QdV6c+gZN048BPF4ERohPBTGK1ms+Ndq3VRT+mRfFpl53iItEslmOgF5yrlwQ7M5CAkg1yoXeYxEspgfoqBBDlzk7/fG/o75kT8SX4pY3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750346394; c=relaxed/simple;
	bh=bthCQ+YkD4ujyeg+3u97IE5fLYwuVz1WctN+JSqstVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZyRfMFRbib1CjoBqQRdrCAisTdYmmBZ4mNS/0nmXGLG7eJFCdFBfMerjOhtjDa7J4GU9QRhLLLlBNRpb15TGAtL8EdJ1Qy46cVh5PAmWazUv+LeJamrO6Qhpc78bmAk/R2Mn6XOzbDXOSmhUj53jbYYdL1EaBO/ESuJ8xBxmyiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N526UxVR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2D1C4CEEA;
	Thu, 19 Jun 2025 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750346394;
	bh=bthCQ+YkD4ujyeg+3u97IE5fLYwuVz1WctN+JSqstVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=N526UxVRetGS1XFnd9yZ8FRzcbUbxwX5fI8mo94kb1eiejuBTGKrQfKNiZeW6MtOD
	 5RC1vG09fLJ1HCHoyJ7d/u+9wvHQbJTtYC20uF/3+Vsca6F2F5IL/AC06RZ9BJ5u7q
	 XBYoVgHeezSgC+8H/wcr6zLc6WAAaF6wvqdcHDUif0DZPKcRqQrj1HGT8/k4GN2dKo
	 ERFYvNJngOUelk2yoNmJBDrrOyxv0ClrPXKCQttlz53H4NxHnlUsE5w5Y8AaEaOrFn
	 6DSI+vxKmoq+uE6ccAySls8o58KXML7md5ebr35K+bZ2Um/RiLpVvm6n41Po9Ca07X
	 6TF/XEapotLiw==
From: Lee Jones <lee@kernel.org>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, lee@kernel.org, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: m-leonard@ti.com, praneeth@ti.com, afd@ti.com
In-Reply-To: <20250527190455.169772-1-s-ramamoorthy@ti.com>
References: <20250527190455.169772-1-s-ramamoorthy@ti.com>
Subject: Re: [PATCH 0/2] TI TPS65214 & TPS65215: Update MFD Cell Structs
Message-Id: <175034639178.919047.12885250485072078236.b4-ty@kernel.org>
Date: Thu, 19 Jun 2025 16:19:51 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Tue, 27 May 2025 14:04:53 -0500, Shree Ramamoorthy wrote:
> The patches updates the GPIO compatible string for the TPS65214 & TPS65215
> MFD cell struct based on a system design change made after driver
> development. TPS65215 & TPS65219 now share the same GPIO count 2 GPOs and
> 1 GPIO), instead of TPS65214 & TPS65215. TPS65215 will reuse the TPS65219
> GPIO compatible string, instead of TPS65214. TPS65214 still has 1 GPO and
> 1 GPIO.
> 
> [...]

Applied, thanks!

[1/2] mfd: tps65219: Update TPS65214 MFD cell's GPIO compatible string
      commit: b2082f5eabe1a2e1a0746258cf9f88bc313d0b35
[2/2] mfd: tps65219: Update TPS65215's MFD cell GPIO compatible string
      (no commit info)

--
Lee Jones [李琼斯]


