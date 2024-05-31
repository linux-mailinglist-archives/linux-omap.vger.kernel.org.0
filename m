Return-Path: <linux-omap+bounces-1435-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC0D8D6191
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2024 14:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47FDC1F254F5
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2024 12:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCA6158215;
	Fri, 31 May 2024 12:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="th/OhZmu"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E668E53E2B;
	Fri, 31 May 2024 12:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717157945; cv=none; b=XFlWV4Xf1L75XmuNNwOQTQxdPY5jaJ0RmMX0eSJpemdkkvQEDWLdGTvW7wqcme+KPBtSs+TwYLKvMZJ6HFfjrjnNvOHVLrAI75IrAFOTyFAd3Q2MnKDUgk/xSPHzPvlKhRPMiKA6bOpGUE9sXbs651+/ferCRNU+djUgZJGTDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717157945; c=relaxed/simple;
	bh=yMwjGQt2YiwKm4996GvOj7CbYePrwPZ4OiotjyUp3UM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=L2LoEC24kCh0XPapPYGz5ern6J50bOgMCuNZuoz/wnrNQz4WGGWMzLw143Y/u3MG0YII8AGyizTp6NtlCPJNpQZSQX7ZWMtiORFJf33c5HkDedjpzEvmbHQNXJpn4OVAecElqDy74W1Lsi2p3ndlhugCozs2uq6Eq2OLfe3fQMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=th/OhZmu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5A5C116B1;
	Fri, 31 May 2024 12:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717157944;
	bh=yMwjGQt2YiwKm4996GvOj7CbYePrwPZ4OiotjyUp3UM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=th/OhZmu/AA/hKgoYJGiCfE9KN9syV251XKSEZFkDhJNNQqQGJgwbvElpLoOv+iZz
	 ibidOjP8gi7mI+YNGVKvB0XvwJ0bC0dAUuMHK53OMwQ90DB7KpfPNyLlXBFxn9hLSS
	 1NSzKnrxnpKQImO/SAcmb0priUCt5KFLkNGqupvAXZ8xgvucnGUPnDW+19VYvP9u2h
	 iuKPQx/JinHAIIESYQEcFZC79/nLwCTlEiysi7FDV0WoIklzt4DeeeVPkqwOeppb2t
	 Ej/u63gnOI/sqC+5FWsPGzoyEiTUu+25ydauEQ5LPKOhRIGZ68nm/TH0kbXHIi2Adr
	 xjXQhsACxSOCQ==
From: Lee Jones <lee@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>
In-Reply-To: <20240508114033.952578-1-andriy.shevchenko@linux.intel.com>
References: <20240508114033.952578-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: menelaus: Remove unused
 linux/gpio.h
Message-Id: <171715794257.1057878.17894932337885407934.b4-ty@kernel.org>
Date: Fri, 31 May 2024 13:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4

On Wed, 08 May 2024 14:40:33 +0300, Andy Shevchenko wrote:
> linux/gpio.h is deprecated and subject to remove.
> The driver doesn't use it, simply remove the unused header.
> 
> 

Applied, thanks!

[1/1] mfd: menelaus: Remove unused linux/gpio.h
      commit: f4f495e07bc70953e6182cd6db1c4cb801648175

--
Lee Jones [李琼斯]


