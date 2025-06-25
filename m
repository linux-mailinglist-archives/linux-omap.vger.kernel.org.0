Return-Path: <linux-omap+bounces-3971-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF422AE7EEC
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 12:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AA9D1892A26
	for <lists+linux-omap@lfdr.de>; Wed, 25 Jun 2025 10:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FD028640C;
	Wed, 25 Jun 2025 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eR7lBNHz"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10461DE2DE;
	Wed, 25 Jun 2025 10:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750846736; cv=none; b=ZiixzStJ4beO4q5hnq95xzP0/AzUTnVaUVsEtES48xT2Er7mFF33vjdYj8gg3zrJPZMcmxtml92bib7ug8OsWq94ZAvHI97z5DyM4LrhsChBz316HMSUmBs7fQCnC2MkvB32B9vkiNgC0MwX7y5WG04klt33HOjWRJD/UNyx0Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750846736; c=relaxed/simple;
	bh=pazPUjSERUFwyROf52BvTjElfu1PQsei9fEm4aI4K5U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E2uWgzshLUcj5tdZqe1OUrQK4Btducbkag3RnDx/4QjSsVYyBnAnltYG7J2hU4tw3Jj3+sBK5SCxlp4ZsBw7ajnkf1J9kGLrKkJJJ6gJpJeUXbG71kmjy0ZluERxGEGI7icfyu/YwwtjTT/G3EYGMBZ7jGimREf3QN2Q7Z0zYos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eR7lBNHz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 975CCC4CEEA;
	Wed, 25 Jun 2025 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750846733;
	bh=pazPUjSERUFwyROf52BvTjElfu1PQsei9fEm4aI4K5U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eR7lBNHzoEOpQpYGT1QPJPHlTTdOmRLTI9+UkeGstRjy10+bj3X4u1vM0FOoMLIEe
	 +D4I8M52ft7KIapdpuq+NKMTOq4qJ08VF2/aOcIBs4SNy2C7QpyzhBn6PU2wI90u9l
	 mrPIL5MJ5HEho2Y1xT1XtL533SieMDyPxpZ+nSUqtMIZ1FCMj9Av+pX0km+HGs9tMj
	 JVO2ldNbZswaF7k2RLEI54ukYd5D0r9/Tmd8BE/6PMBws1U8cHDChZd4GKkQA2XZhI
	 E1Ry+7xqTuIaCabzgDezi3XdWj5WbP4LiVEvWtpjUmtNwTfRt31/+yA5fvCWXu/2+v
	 US/zsLqzOieSw==
From: Lee Jones <lee@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Lee Jones <lee@kernel.org>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr>
References: <c4abceb95665e4363937a1f41588772f38c47411.1749998382.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH 1/3] mfd: tps65219: Constify struct
 regmap_irq_sub_irq_map and tps65219_chip_data
Message-Id: <175084673128.4146676.9463086571840704155.b4-ty@kernel.org>
Date: Wed, 25 Jun 2025 11:18:51 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Sun, 15 Jun 2025 16:40:20 +0200, Christophe JAILLET wrote:
> 'struct regmap_irq_sub_irq_map' and 'struct tps65219_chip_data' are not
> modified in this driver.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   27413	  10272	    256	  37941	   9435	drivers/mfd/tps65219.o
> 
> [...]

Applied, thanks!

[1/3] mfd: tps65219: Constify struct regmap_irq_sub_irq_map and tps65219_chip_data
      commit: 33b7335e37896ffbc8cc5dcd46f82d5a0e654bf8
[2/3] mfd: tps65219: Remove an unused field from 'struct tps65219'
      commit: 0bbdb525bfa39980bb2f4bdaddd73591eedb6346
[3/3] mfd: tps65219: Remove another unused field from 'struct tps65219'
      commit: ea003d0598460c84effb55a13c362c9c1c6e1cd7

--
Lee Jones [李琼斯]


