Return-Path: <linux-omap+bounces-3041-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB18A0723E
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 10:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C34E167CAA
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 09:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E53752153F5;
	Thu,  9 Jan 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S9tDAfZU"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8155421518C;
	Thu,  9 Jan 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416549; cv=none; b=liuyiDdKDTewcC/SwiNiqFpSwcEEbZvGmPEwsB27hra0nSmM0U9CXvOJqCiQvfg6XjxUlHvd3bxnPzfqw+zj7DvlV5Xsbtf0pnJ76kMretpKLE3Pqj/2dPJGrKumtgz3XFuu+mW9I7yLEKYBwZd3yeexlPfkTiieMfYYMcgSECc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416549; c=relaxed/simple;
	bh=i9g5LIJcC/LoH3k6ODFb4zJPrXiHRFVqmVBVLupzvs0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PfxI6uTy4M/TAuLdOpJmzio+bs08ufva9uLhxqktj/bqfLzxQ8iNv2MYmSxOD1r/IfZwT6dJhLodOgz01/3BcHlo/5Wm0lSWvtMk+YOJ+xS5dg5Ofk/J3ezxGgmdhUQIB0IVFgDpRS6iOrIBZHvXKy08aADQ5Jz/x6Sf/udrGj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S9tDAfZU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F066CC4CEDF;
	Thu,  9 Jan 2025 09:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736416549;
	bh=i9g5LIJcC/LoH3k6ODFb4zJPrXiHRFVqmVBVLupzvs0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S9tDAfZUoUCCV42s3y30VSPO8mlRXwW3YIcizODmAOtrHE2p2KPwUOPK7sqRcD5Gc
	 IIiZpK/FOp+VHtGUUyvOin8bm0gUQKdvLrsatIQ/OE1m9RqoJi72AEpxiBNJ7y9Bw3
	 D+aX9duDFwn6fpq616mOcFwTew9fjeNOuunSZh1RVOqDrVfSWQO8HGBhmzFrMPdrNQ
	 Yd4mIeBcqsbE5+B2npzRQU0HFQOGceu31un9XkwoIZMO/79aLuLyANbgijOuWjFKp+
	 SojlZ5ceyYKDve8SC04DolREi86BynkmJqIL+rNz9jYdVsmNwnmuA8OxnE6ah2A0yg
	 wB0u9I0bYQ7ZQ==
From: Lee Jones <lee@kernel.org>
To: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
 rogerq@kernel.org, tony@atomide.com, lee@kernel.org, brgl@bgdev.pl, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: m-leonard@ti.com, praneeth@ti.com
In-Reply-To: <20241217204935.1012106-2-s-ramamoorthy@ti.com>
References: <20241217204935.1012106-1-s-ramamoorthy@ti.com>
 <20241217204935.1012106-2-s-ramamoorthy@ti.com>
Subject: Re: (subset) [PATCH v1 1/2] mfd: tps65219: Use MFD_CELL macros
Message-Id: <173641654673.2549594.6401348926604719411.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 09:55:46 +0000
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Tue, 17 Dec 2024 14:49:34 -0600, Shree Ramamoorthy wrote:
> Use MFD_CELL macro helpers instead of plain struct properties, which makes
> the code shorter with the common defined MFD cell attributes.
> 
> 

Applied, thanks!

[1/2] mfd: tps65219: Use MFD_CELL macros
      commit: 6891e88dfbbcd897b381dbc464211bf31a854509

--
Lee Jones [李琼斯]


