Return-Path: <linux-omap+bounces-2395-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D002F99935A
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 22:08:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6DB15B23779
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 20:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B95821CF7D6;
	Thu, 10 Oct 2024 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LybgZ0cQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540B0188A08;
	Thu, 10 Oct 2024 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728590914; cv=none; b=lbdYvlm64DMVwJxUfMJsMWMfYtqU1bs+hV/EI2MoZpnXCdUmQsLM3QH8VGmggZZ5QmTbBRyS6WL1fKDeagYwNH9X/MNxxuy+Ho639Fa2uffVadWgXcqo7YJWQXZfUnBqpAe8qCiBXKHMaCwfubnJk26Znq2Hk45ukcnCBBzVuBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728590914; c=relaxed/simple;
	bh=I7QFyJYtnnOKhd17UuodCzsu3nHwBtZSDBog9V9WP3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gjQXtC/Zvjsif0YLClPHtj7Q/HJ+MzZLXYuaUFmc1ZdZdenkqghAXLYcWcxwLbIPv3QGNraptEC7j70JMKZcewd+t7RGr7Xm54rHGwbDP8bpG+ZYwQj71KF90TxvF9jYx2//gHdJ+sFTH8YbAmLpthRxhRgM7pNA3NYnP63ZU7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LybgZ0cQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5241C4CEC5;
	Thu, 10 Oct 2024 20:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728590914;
	bh=I7QFyJYtnnOKhd17UuodCzsu3nHwBtZSDBog9V9WP3A=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=LybgZ0cQ3kim3VFwRSITsdLgCGy3n/7hDARnm0O1m7AADV0aYDhP7jGEykvNfzUEV
	 ALlwc6/cKHwsEbi2F6fAsoTqY+usXOWHx5bul8u7u4k7tMWyyyzxq5+0MUtubxC8j2
	 zw/4WUX5kN7Y7BiYT89zeUVyOESAYKBD8oM90sA4OfsvMULCmxdDioYcMH7sJTBnsJ
	 JeeyF1I/jlqnzQwwwRPwdsyWFArLRiJLxiNaPlyANApVGXCwuGrbH/E8iVmVrY+mdq
	 cPVER7emIDyx2FZR319oLDrWUr9yvc42UpWbGwFbJf2CG3M6G5aB1L3dLgNeCcl416
	 9AfCKN8Ufi60Q==
Message-ID: <8c55e3ae-3a5e-4975-ae50-fa2de78f5b1f@kernel.org>
Date: Thu, 10 Oct 2024 23:08:29 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ARM: dts: omap: omap4-epson-embt2ws: wire up
 regulators
To: Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, tony@atomide.com,
 devicetree@vger.kernel.org, khilman@baylibre.com,
 Conor Dooley <conor+dt@kernel.org>, aaro.koskinen@iki.fi
References: <20241010122957.85164-1-andreas@kemnade.info>
 <20241010122957.85164-3-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241010122957.85164-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/2024 15:29, Andreas Kemnade wrote:
> Wire up the regulators where usage is plausible. Do not
> wire them if purpose/usage is unclear like 5V for
> many things requiring lower voltages.
> 
> Tested on vendor kernel that backlight definitively does not react
> on blc_[rl] GPIOs.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

