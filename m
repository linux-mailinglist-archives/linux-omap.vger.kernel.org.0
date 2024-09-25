Return-Path: <linux-omap+bounces-2243-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D031985342
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 08:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F22428123D
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 06:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607D4156222;
	Wed, 25 Sep 2024 06:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BHO8om+E"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB63D155A25;
	Wed, 25 Sep 2024 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727247164; cv=none; b=N1SZJEcoj3fo3ti0raEbJVTIrgLyKBXQSXiO76sch9/Vw5JOves+lCdeIFLe5eo0lllsonYUIn5UBCNBb6oM0gNU9FJRCWn1BBK5RS+POJjdo/iA/RHkQWVhfVdTQ5T0jtGNoCwKjWA9pZt7jomLtCmt3+mbLQcYu9tor1YoZuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727247164; c=relaxed/simple;
	bh=KLZATHZn1r6caQ2yuujVtvluk43DfEBBZHvX3r39fEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JCYff29KYUVZsl+qSo6Otl3TEkwX0PXGt+aB1OdQ6rOhdSaesP+yMO394VL3nZBnpcXqSftHskDkn0BoXiINaVtXOzW7ZPTHVTzeJ0X9c8IPTCAp+KOQvW+nYHFiO6HveeutWO9Jg6MfpD/+V6PhtnVNBsN2En1ciJE6RNmqE6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BHO8om+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34D30C4CEC3;
	Wed, 25 Sep 2024 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727247163;
	bh=KLZATHZn1r6caQ2yuujVtvluk43DfEBBZHvX3r39fEc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BHO8om+EfbAP5rX4yaAhNEAd4edcIOatU1RCcNxfeloMJBcdaLS3C+7XH3VoDeZcZ
	 r1D5z0fRsO3j27GqtqclhqpLQpK9n7IrJpsIVTU0wR4xgaQYOdF5sbisN31ldL9/rr
	 ew2OyNTA2PcDbFfK7tnRpf4ER7SQ7AE4N7kASG5thxYLcZTVe11rO0RnWHxAhRtKhr
	 XGVdgVIpmfyO1AFupme7BUG1DWqOORRBHjJ/65Ko4rzg7YOp0EHJrxDoOtDoqxqOvG
	 Oe1cWrSyzW1V0LlM6sm0egKAxPQz1Y21Lc4LVgw0ZpdMti7+1kbmsg7GejRKyY5na+
	 NtbcE2EoSnP6g==
Message-ID: <c4535369-0c17-4cbe-a2dd-e0c093029a58@kernel.org>
Date: Wed, 25 Sep 2024 09:52:38 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mfd: twl-core: Add a clock subdevice for the TWL6030
To: Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>,
 linux-clk@vger.kernel.org
References: <20240924103609.12513-1-andreas@kemnade.info>
 <20240924103609.12513-2-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240924103609.12513-2-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 24/09/2024 13:36, Andreas Kemnade wrote:
> Also the TWL6030 has some clocks, so add a subdevice for that.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

