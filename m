Return-Path: <linux-omap+bounces-3856-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD049AD8CF3
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 15:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F2813A4F0F
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 13:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1849B481C4;
	Fri, 13 Jun 2025 13:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDBxRuyx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FF1275B16;
	Fri, 13 Jun 2025 13:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749820543; cv=none; b=OrMTaTL6L56FcfWSeO5TSBogssf7RNZwKWuKPMQ8pKA9fSkv0L2appRuX6x2izgrVAGeC5EjxUuSiQGxTwl/z+U9RjxvuzZTqbvYpya9Yn+gT6SDRSN90ydXIzGEGel/I6ZJ8crFo2dSel8xSDmUoUbcgZlD4RBtrwt0KHSTWAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749820543; c=relaxed/simple;
	bh=yL3670z68hYeY8EGC3U63sSDcHZuXDqOHnkICFekZuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6P2LPgHgg4MGr8W2WOWIV2tiKQWb+e3fQydwoybbcW0ytaTtti9itIiAo89qSY92eAcq/oTpOVVSsCOjKClUS4D/o6gxJW9lPc3h/LLF1IpZeYKeeI7PjTqcLeudOiM0BebskXyPK6ELoR8uD7XrRLS34pwOU1KAylB7oFIVhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDBxRuyx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF9CC4CEE3;
	Fri, 13 Jun 2025 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749820543;
	bh=yL3670z68hYeY8EGC3U63sSDcHZuXDqOHnkICFekZuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDBxRuyxQR+wk2uOG1pn+a9RS3cf8kjxQnxBlnGPycnWcjVY+CwPEbdheCl67R72K
	 Vk/mMuwqOU8nznFDRh6iXMA/Vpp1/g0KRXHObRieu/bxyOZz6+4n1vEkW2+d05AxqX
	 SB5lj60ydD3eb8dTpGy5ZL5WV8zV4YDC79lu5ysTI9tHGllDsaRjoPPMJwYVp3oGPN
	 tcc9W+WT1Fn7wB9i1uebH1cpXJHr/xfbh9YIQbmNL3VpD+our7WAf5wJk0zAAtZcXc
	 klSr8jO28y2g9oQXBLocQ24lcx9MtSqIREU5mHU61WXZFP4RqEnVEaFk63LaQdIdeP
	 Qpd5md1qeotKQ==
Date: Fri, 13 Jun 2025 14:15:38 +0100
From: Lee Jones <lee@kernel.org>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com,
	afd@ti.com
Subject: Re: [PATCH 1/2] mfd: tps65219: Update TPS65214 MFD cell's GPIO
 compatible string
Message-ID: <20250613131538.GS381401@google.com>
References: <20250527190455.169772-1-s-ramamoorthy@ti.com>
 <20250527190455.169772-2-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250527190455.169772-2-s-ramamoorthy@ti.com>

On Tue, 27 May 2025, Shree Ramamoorthy wrote:

> This patch reflects the change made to move TPS65215 from 1 GPO and 1 GPIO
> to 2 GPOs and 1 GPIO. TPS65215 and TPS65219 both have 2 GPOs and 1 GPIO.
> TPS65214 has 1 GPO and 1 GPIO. TPS65215 will reuse the TPS65219 GPIO
> compatible string.
> 
> TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/
> 
> Fixes: 7947219ab1a2 ("mfd: tps65219: Add support for TI TPS65214 PMIC")
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>  drivers/mfd/tps65219.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/tps65219.c b/drivers/mfd/tps65219.c
> index fd390600fbf0..297511025dd4 100644
> --- a/drivers/mfd/tps65219.c
> +++ b/drivers/mfd/tps65219.c
> @@ -190,7 +190,7 @@ static const struct resource tps65219_regulator_resources[] = {
>  
>  static const struct mfd_cell tps65214_cells[] = {
>  	MFD_CELL_RES("tps65214-regulator", tps65214_regulator_resources),
> -	MFD_CELL_NAME("tps65215-gpio"),
> +	MFD_CELL_NAME("tps65214-gpio"),

Neither of these exist anywhere.

I'll assume they will be available soon.

>  };
>  
>  static const struct mfd_cell tps65215_cells[] = {
> -- 
> 2.43.0
> 

-- 
Lee Jones [李琼斯]

