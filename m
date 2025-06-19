Return-Path: <linux-omap+bounces-3914-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AE7AE0431
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 13:46:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B252518866A2
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 11:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E758422A4D1;
	Thu, 19 Jun 2025 11:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNzYivlS"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FC122A80A;
	Thu, 19 Jun 2025 11:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333469; cv=none; b=OWcsT2FSCdqbPz9W6bo+4t18AzxUjU8Og5ygj3QUSU+B9j57rS3qKVJcNgdukCG2cPICpOt/HcXy83ZGLnoj+h4XQZgS5CxFNFn1y4bBSqIN02srQY1in46XF0v75tIRzqc1o4QfVu2+9dcaWgyIiDPuKxlRg6ksHwXIKJ8W4fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333469; c=relaxed/simple;
	bh=Sr15eZ3r8Zv+dj5dPnWk7Tqv/FsJmFDWGmUOcG4SSus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eG9awovGC+TCzBFzGDPy61rgbfUlD7vtC6z9Dv1fnHHy5duIt5Q3bpTrDLU0qXlUkjy5veXtS/cmvoI0fCeu9r/uJXmgQKTh0PdBb+o5quXj/wsKZPHNYOq3ZjZk45mMj6DVMNRC0VeRs55y2Nq3cimG77Grj111kaAiSpwuUdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNzYivlS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC4ABC4CEEA;
	Thu, 19 Jun 2025 11:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750333469;
	bh=Sr15eZ3r8Zv+dj5dPnWk7Tqv/FsJmFDWGmUOcG4SSus=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNzYivlSpmdQIi0i6WhlDStaCVZp455regU7XREl009Ek5SJ75Y3NqpszGPTOHmWp
	 4AdsSBzxWda2urSNsXYilW7DWzD0OEta/+L8EbfXnNRzfm3hkGru9qmkP2g0u6pqPw
	 x04SwqtUbOJK16Wt5SZVJtQ+Q2dXK9nyLNpHQehJtnlEEtIvwa6cnysTj7Y5EpLuLl
	 sF6jgM2NmfgI9GWDq5Dx/rQ6S31AQsGdRzF8qJhfXvcKxyVUi/up61xP+/lFeQILfl
	 IgXyiFFK1i5CYTDGklFilqdRnH39pbpFgg7lO1n3elIFoXn8UqCC3dsrLeEoO3qZnM
	 FWpLcy6Jdh+0g==
Date: Thu, 19 Jun 2025 12:44:24 +0100
From: Lee Jones <lee@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com,
	afd@ti.com
Subject: Re: [PATCH 0/2] TI TPS65214 & TPS65215: Update MFD Cell Structs
Message-ID: <20250619114424.GG587864@google.com>
References: <20250527190455.169772-1-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527190455.169772-1-s-ramamoorthy@ti.com>

On Tue, 27 May 2025, Shree Ramamoorthy wrote:

> The patches updates the GPIO compatible string for the TPS65214 & TPS65215
> MFD cell struct based on a system design change made after driver
> development. TPS65215 & TPS65219 now share the same GPIO count 2 GPOs and
> 1 GPIO), instead of TPS65214 & TPS65215. TPS65215 will reuse the TPS65219
> GPIO compatible string, instead of TPS65214. TPS65214 still has 1 GPO and
> 1 GPIO.
> 
> TPS65214 Datasheet: https://www.ti.com/lit/gpn/TPS65214
> TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/
> 
> Shree Ramamoorthy (2):
>   mfd: tps65219: Update TPS65214 MFD cell's GPIO compatible string
>   mfd: tps65219: Update TPS65215's MFD cell GPIO compatible string
> 
>  drivers/mfd/tps65219.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Doesn't apply.  Please rebase the set.

-- 
Lee Jones [李琼斯]

