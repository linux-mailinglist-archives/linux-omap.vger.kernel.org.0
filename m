Return-Path: <linux-omap+bounces-2701-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7AF9D033D
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2024 12:19:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6F3FB2407A
	for <lists+linux-omap@lfdr.de>; Sun, 17 Nov 2024 11:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0825D165EF8;
	Sun, 17 Nov 2024 11:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="NvFbFGfJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA13533E7;
	Sun, 17 Nov 2024 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731842378; cv=none; b=STYrXN/319j47yASXc1UF+MSm4s/ybjZ70Q4I9nSkaPBroKg+WyhFHLm0yuk6I/SlyX46SftwZC3ANnzKvCxAWxUJjXy6sp0jrKAoMC+ujhdBfP/l/tvaLs3gLA5QrWfjhDMb/toeR4jWMAo8eBvpsWFZZsETdALf8DWjb30H3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731842378; c=relaxed/simple;
	bh=LT9cYsCC2zp2PrqfzRc34u0V2YLHPBoEEj6t/hg5Vn8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sx5fM13lWnPWtQGKLoTYodPQt9yucfpy7iwjz7BfVrI/Qfu18E/HGMxqAhKHoeXbJOTXM1hCH2u/vVbrYy8hwW2oXHFidpEoNiOOVxPZ43iTbzdTKjNiOQH65j6qyD5E5BCA8HuzeDv1kfenqFod/GPH2EQpsvAqp50Py7KM9JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=NvFbFGfJ; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 12387604F3;
	Sun, 17 Nov 2024 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1731842370;
	bh=LT9cYsCC2zp2PrqfzRc34u0V2YLHPBoEEj6t/hg5Vn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NvFbFGfJpHrZynOGbuXVkFOJmVd/ybvtXtQgvFOYrfUkVkuoiKBlsL+KR7hsdcYBM
	 /ZmqLEqhTkgYImJaXlzc8kLgRWQztXTbojlS6xoTIiyfti6D6vPptJ94/enibGABno
	 B+dZOkj1OjnDe04y83B1WO8DEjVUFVJofUB2KiuzMxZcsyPHNiWHp8dAs7QJGs4uCg
	 s+9iLGPeBMle+YzDJpcbqWt8yxbFEmHHboZnmYlq2MJAzAlUBtLRFrjgeJQxZXK09+
	 2mvKRAzv3xyR6NPhIG3eXGJWWUeMLai5PONwCdJswXTyz7/xqZzOvYZXCo2vUV7coo
	 dV0VyNhX3Nynw==
Date: Sun, 17 Nov 2024 13:19:03 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Roger Quadros <rogerq@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	aaro.koskinen@iki.fi, khilman@baylibre.com, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
Message-ID: <20241117111903.GB23206@atomide.com>
References: <20241107225100.1803943-1-andreas@kemnade.info>
 <b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
 <20241108184118.5ee8114c@akair>
 <20241111150953.GA23206@atomide.com>
 <20241111193117.5a5f5ecb@akair>
 <20241111234604.66a9691b@akair>
 <20241116212734.30f5d35b@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241116212734.30f5d35b@akair>

* Andreas Kemnade <andreas@kemnade.info> [241116 20:27]:
> mcspi is per default in slave mode, setting it to master solves issues.
> And that happens when the driver is probed because its default is
> master.

OK interesting. Maybe set up a quirk function for it in ti-sysc.c.
That way the mcspi will get idled also when set to status disabled
and no mcspi driver is loaded.

Regards,

Tony

