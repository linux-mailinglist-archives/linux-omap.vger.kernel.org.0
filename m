Return-Path: <linux-omap+bounces-2810-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E15609EE642
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2024 13:06:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 587B21697A9
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2024 12:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4AD0212D84;
	Thu, 12 Dec 2024 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TkGawduc"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD5C211709;
	Thu, 12 Dec 2024 12:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734005050; cv=none; b=TqJESywaEUdjkkWb6+93WLZC9humhL2mO4jFKZDj7zMeB0s2NHlHM7QIQ7QnhvceqvR2DF5DK6dzQqz9vt+QYqQTJyh7cRlJudJsX5TyULnCbjfnitLuG0S1aytz/7SOvW9gBv18k42rcpTuwkg9tcZXgMftSyVVgTl28j1XstM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734005050; c=relaxed/simple;
	bh=RfOLn8Lw/o/AXUvxY0hJdWZlBIvTpXuRuyI9AhtSbSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XA/YC9ETz7CcI1fIgInd9+ftBnA6lE65oKSBAPdCAGZwtSAi6YStyVcBZgiEU2e+ygTlKskhQddVznaf8/j7kdiejKh1UApqc0Bb8ZhSgh6bl1QiS71c2gqBtMVH06ujyquZ+xws8PAATemGavNI7fRJx5sriXA0sBHzpbqmJ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TkGawduc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF8EC4CECE;
	Thu, 12 Dec 2024 12:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734005050;
	bh=RfOLn8Lw/o/AXUvxY0hJdWZlBIvTpXuRuyI9AhtSbSY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TkGawductzIAB5CguwCO4LZOxUesChjwQWhRliBvgNfKedppRkmgF8+Goigib845Y
	 wnEpXeyTXL4KPoWqt2+qxWHFH1fMftolRQ+sKMX3wtmuclLA7ViOXXWr1czBgOutBV
	 GEBiwHqfD579zLsvIIYkKYD/UFh1kTV6ntt3opInwOnfw2J+9d1DfY8M/hn2wjUv0v
	 COpU4TVWHsqFvvEYahRVoVkdQxS+pBXDxvYfIszRI+cRK6pp4Q+f28FRqROkDnLyjh
	 4tsc2aCbzhSn06jtU7fscX0OcyTYdQFmfe1BneaKa8I+9JrLH9wfV/IojOLE/JTXcO
	 eQxaidtob4tGQ==
Message-ID: <8a4b162f-9e83-4234-9480-d5045d19539c@kernel.org>
Date: Thu, 12 Dec 2024 14:04:05 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] memory: omap-gpmc: deadcode a pair of functions
To: linux@treblig.org, tony@atomide.com, krzk@kernel.org
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241211214227.107980-1-linux@treblig.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241211214227.107980-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/12/2024 23:42, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> gpmc_get_client_irq() last use was removed by
> commit ac28e47ccc3f ("ARM: OMAP2+: Remove legacy gpmc-nand.c")
> 
> gpmc_ticks_to_ns() last use was removed by
> commit 2514830b8b8c ("ARM: OMAP2+: Remove gpmc-onenand")
> 
> Remove them.
> 
> gpmc_clk_ticks_to_ns() is now only used in some DEBUG
> code; move inside the ifdef to avoid unused warnings.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


