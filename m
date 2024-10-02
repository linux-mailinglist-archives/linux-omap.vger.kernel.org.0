Return-Path: <linux-omap+bounces-2294-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AA298D2C2
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 14:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 551A31C21ADA
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2024 12:09:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2591CF7D0;
	Wed,  2 Oct 2024 12:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcOFLvaP"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B431CF5F9;
	Wed,  2 Oct 2024 12:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727870979; cv=none; b=MwBMaeMAIYMScSRjfKv009KCY63mPxrYu7mWwnI5309bIc8s2ZKGBcxb0sQB7ojw/dOP9wKRO9Q5w8ulFRMdd9/5uKzyMA407yGsiIoTcgAe5YKYxBDwNrIVehY2lMF+R1FhOuTBE/HlAb1bPm4+aTe8HsL7CKKsx7z/1USFIHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727870979; c=relaxed/simple;
	bh=w4SNft/dQY4c6ZDGWsJp/nrY+/Ovr9HvxUA0XZRWHWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tjZwoWKPeSDYUmDMVB9nAKPGG8gnyKITQjKa4T5N/Tu1hEzWlG984HpXXpnjF3SuWceYmIoRfC702jIUiGV2dQMrN3nOpc7VGDOzjGbk9TFCoGmhRAIoKSFOTjWCrnDgIKifwLK6Yji8ykHu6kGFreamllRQ5tWNBnrNJCBpXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcOFLvaP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A33C4CECD;
	Wed,  2 Oct 2024 12:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727870978;
	bh=w4SNft/dQY4c6ZDGWsJp/nrY+/Ovr9HvxUA0XZRWHWM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=bcOFLvaPU7PEsAg0lWJEQrjtZsiVjv+aBRWN9+9ewicsMLb/0cU34aVROcD8Ccbur
	 BlsIvq8VEPNlYzOejm7SpcZahkbnLN2b6fTz3TH5YbcO7ejNeFa9N98/PcsyDI/SmW
	 OSZlAaj5Gtg9oPLOOzA4QGd4lX4XVpnfXd4aDNO/RO7mQmdxhtlOWKjKKRAJlcgvKF
	 gx49EjLLUix1oCW2nOdUspjOw4YWaqU6MRu58kRWmxh9s6EwqYoa2sKpakPHmrxXG4
	 rtN9fXJrlt0Crhtg+5NVYEME821KjRAtEnAlY3+H+xJOIwAUnU2S2nKOCZR6QXtYs3
	 tDYHDMqEiTQ6g==
Message-ID: <ca94341c-8fb0-42cf-b42d-bd53128f3433@kernel.org>
Date: Wed, 2 Oct 2024 15:09:33 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: twl: remove is_prepared
To: Andreas Kemnade <andreas@kemnade.info>, Stephen Boyd <sboyd@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
 linux-omap@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
References: <20241002110718.528337-1-andreas@kemnade.info>
 <20241002110718.528337-3-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241002110718.528337-3-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/10/2024 14:07, Andreas Kemnade wrote:
> Remave is_prepared to simplify adding of TWL6030 support.

Remave/Remove

> The default implementation should be enough.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

