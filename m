Return-Path: <linux-omap+bounces-4280-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E81B2DED5
	for <lists+linux-omap@lfdr.de>; Wed, 20 Aug 2025 16:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21E12A01796
	for <lists+linux-omap@lfdr.de>; Wed, 20 Aug 2025 14:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8EE267B12;
	Wed, 20 Aug 2025 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GMM6XANz"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB9521D59C;
	Wed, 20 Aug 2025 14:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755699002; cv=none; b=hpDHvdJacUQD1DX5l0PkOUSM4gp6GBS3hUif+bDNJlGtrKqgYWCPRvhfy+uTsVSTMhy7UCozC2Abt5JwwfBJI1mlDWEIACD/RIBlW0jKNdZf9i1tuaffqI1Zyv2TLm2YR6BWylNRxcDt0AQHkXDu9E0fho0NMVTb7JXXejxPlYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755699002; c=relaxed/simple;
	bh=sqe9qbdA5TL2KgyWbfPjytwIiDXhTpLiFklKKC5M5OM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKa3uqtymlHV15EI6cY86u/KAnu/dRYcec/FWsLUB5J9JdRZKNqKaj72rq+2pWKwPQeX9rOemcLqfLEzSiFOY3aaRe+4Nqn4h1cEiQhBXjl8lgVP5NfUmdkvRbHKi8pq9dvLtrOamTR/HSDFW1ezhjCSqAKoC8F0H4h50UP/5gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GMM6XANz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7290FC4CEE7;
	Wed, 20 Aug 2025 14:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755699001;
	bh=sqe9qbdA5TL2KgyWbfPjytwIiDXhTpLiFklKKC5M5OM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GMM6XANzM8Wfka/z8j65pbK5D086lEeXEVALZQD3sYoycjLS9K29uAzVFD44rlNJB
	 MlG0IXvA5PNoMRfR8FrZuLAqNcz+LdQmO+rz6Ie3kG+KTvxzGBPsomDaCs7sVYVIdQ
	 dus81eiQB6WhPWX1/vpEn0N4TvsrrcBGbm/BJq6lHzOYzbsXZXPExhTM/RflTzh6Uy
	 cn0H7ZZzR0s6Ts27se9ZiuOkZWKoPt90tSQJWnwu1nAxk5Cj0g2ZAut2AIi5JV3IPJ
	 ZHxWbJc2tsVYljICGkq656wx9Bc5I6duPM+r7W2YmjhFRH0SuYOpQbu886CVEyUyrQ
	 DBh8zaOJVqK6A==
Date: Wed, 20 Aug 2025 09:10:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: linux-omap@vger.kernel.org, peter.ujfalusi@gmail.com,
	broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org, shuah@kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] ASoC: dt-bindings: omap-twl4030: convert to DT
 schema
Message-ID: <175569900018.3357203.16722669550945555808.robh@kernel.org>
References: <20250819201302.80712-1-jihed.chaibi.dev@gmail.com>
 <20250819201302.80712-3-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819201302.80712-3-jihed.chaibi.dev@gmail.com>


On Tue, 19 Aug 2025 22:13:02 +0200, Jihed Chaibi wrote:
> Convert the legacy TXT binding for the OMAP TWL4030 sound card
> to the modern YAML DT schema format. This adds formal validation
> and improves documentation.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> 
> ---
> Changes in v4:
>  - Deleted redundant pins list.
>  - Split from larger series per maintainer feedback.
>  - v3 link:
>    https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/
> 
> Changes in v3:
>  - No change to binding content, only updating commit message format.
> 
> Changes in v2:
>  - Fixed comment formatting (added spaces for better alignment).
>  - Updated commit subject to align with subsystem style.
>  - Retained Acked-by from v1 as changes are cosmetic.
> ---
>  .../bindings/sound/omap-twl4030.txt           | 62 ------------
>  .../bindings/sound/ti,omap-twl4030.yaml       | 98 +++++++++++++++++++
>  2 files changed, 98 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/omap-twl4030.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/ti,omap-twl4030.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


