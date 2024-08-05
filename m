Return-Path: <linux-omap+bounces-1835-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF2C947BD3
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 15:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09173B209DA
	for <lists+linux-omap@lfdr.de>; Mon,  5 Aug 2024 13:28:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 812E215ADB4;
	Mon,  5 Aug 2024 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iIy7v1f0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223A0158DCC;
	Mon,  5 Aug 2024 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722864498; cv=none; b=diAjsV+lp0wnZpswEOO+mO/0947ufm8C2W7Iu1RkhuNdLP5QA/ydquGbV1JviSfGRnUAbtsYE5oxOWSurIGZW+Fc+mIRUodO/wO1faRwznjQHeathdE6SOuDWuQs0LdwfmX9FF9uDlnSrEV/PXjq2xQel/3w//0HIdXMz5N4FNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722864498; c=relaxed/simple;
	bh=5PTQICApWAhx/MQLjZm16fmpzHV53D/iUNg38iuXZ38=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LyNR2vLNmfiidPnjI/+yISmIhW3RfS5hmta7hdVKSqlj9QZA3sTADDrVyrh1/PNUGqdM5xyHerlbGLdGQkuGUpQFsoOEH30rST8asoQZtdMH9goTbHcwQTv5UjbSKatyhm6JNrbuw/QxLY8rKZdVx1ELv8+bhB7FPFDogX+8i08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iIy7v1f0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D42EC32782;
	Mon,  5 Aug 2024 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722864497;
	bh=5PTQICApWAhx/MQLjZm16fmpzHV53D/iUNg38iuXZ38=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iIy7v1f0SrPeD3zkHH5oDyCzh7OXBWN4hnIRlZfS/xKow5C/HjlodzLlsgCBzxF/l
	 QLEIWaozy8C59RNxEpy+kE+7xUtn4aPzxcJdD1U/SwTamIxd5vDozfCRqqClkjJ+LS
	 4gdH8mkVP4KwxxBPBSEpltppq+FZl7tqwxjvh8V5wfnZMnQycisxL25MsCvsYlDNUd
	 eDQnzdcukK2i6z/KjYHzBvwOZKEXD2vWE/KOORw1DmUJvPlqK/pVMHiNNvuMsUbqbf
	 Nr/NXyW8Sp3xCLfRJSOaaF/fPxt2sDFsjqFAhArPwcLTVpN1mlsY18VzzfQpBHOhC+
	 1Wfl2XN7ZQLUw==
Message-ID: <5b8954fd-201e-4c96-ae25-1d03f9846ccb@kernel.org>
Date: Mon, 5 Aug 2024 16:28:13 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: ti-sysc: Remove excess struct member
 'disable_on_idle' description
To: Dhruva Gole <d-gole@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Kevin Hilman <khilman@baylibre.com>, Andreas Kemnade <andreas@kemnade.info>
Cc: vigneshr@ti.com, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240805101118.427133-1-d-gole@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240805101118.427133-1-d-gole@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/08/2024 13:11, Dhruva Gole wrote:
> When built with W=1, the driver throws the following warning:
> 
> ../drivers/bus/ti-sysc.c:169: warning: Excess struct member
> 'disable_on_idle' description in 'sysc'
> 
> Fix it by removing the excess description.
> 
> Signed-off-by: Dhruva Gole <d-gole@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

