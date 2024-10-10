Return-Path: <linux-omap+bounces-2397-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2346C999392
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 22:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCA801F235A3
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 20:17:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D27801DF997;
	Thu, 10 Oct 2024 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CS0PTAho"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F89318C03D;
	Thu, 10 Oct 2024 20:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728591438; cv=none; b=TqQExQBnTmwTxnNLZvXRbWBWX7tBVcVZfC1WrMGqiOYa7dfzVxXv5w6ZFq/Yca13sQkPx/Hrf7Qw9mprEB797VscC/E6fXL5lzTSBY/y+ZRb9+IzoLeA+BdGOA1v9Q3KkrAKn/DI5c1SH5yy9NKWG6bVOdIhyDjEatkHZJZ/uww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728591438; c=relaxed/simple;
	bh=RKWcVPjelQ3cvsy3qKD5QQj4cKgw7ydYbcd2aN43VyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RIk2dNdO6xd2xXl0uO6GGxPSNLnTbmIM7QQHKExxMTZ31wvGecfddz2ovx5SUwFPpeJUm9BGaCXv3EMfYPqX6t9vfi/9zHoRgO5CfS6iCNJPmHpoe75fnRfPWii1zI/Xy6rGSURjHmdG/qJiP82/kB24klFHXBTkoY8QqVdmNiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CS0PTAho; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE1AC4CEC5;
	Thu, 10 Oct 2024 20:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728591438;
	bh=RKWcVPjelQ3cvsy3qKD5QQj4cKgw7ydYbcd2aN43VyE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=CS0PTAhoWX/X2iF5gMG38qihCqVp/xNvKtV3X1s2z3vLiP2PRHFRgz/pqp6wRbugr
	 cifVC44ycHghNokrhq7Z/rqd/hqS4+Iw6WNocaXfIjSbgDrmywVHd97lmlEthGGXyp
	 f+uh8J7GjQa/FWwvWHCUtJJWrFWMrUyENPQ1XwbKnsyv/olPZGEy5osK/uLa744QC+
	 mUgt6MBtp7j/OzcjjJmnctkjJtxoPT5OV+0oaLQeGRHVZfFcVh+3OQ5j/EoZPcE7F6
	 hcqqCAZ0VWkUdRsfZf93ewWFG8jD7xnQ5e8/h1oHaGjkZjXJvQfNa0USBqlsTWt6Ur
	 iwAVlk/lDqIAw==
Message-ID: <8fd056d5-a357-4705-9352-632afcfe12fa@kernel.org>
Date: Thu, 10 Oct 2024 23:17:13 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] ARM: dts: omap: omap4-epson-embt2ws: add GPIO
 expander
To: Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, tony@atomide.com,
 devicetree@vger.kernel.org, khilman@baylibre.com,
 Conor Dooley <conor+dt@kernel.org>, aaro.koskinen@iki.fi
References: <20241010122957.85164-1-andreas@kemnade.info>
 <20241010122957.85164-5-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241010122957.85164-5-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/10/2024 15:29, Andreas Kemnade wrote:
> Define the GPIO expander which controls at least some camera gpios.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

