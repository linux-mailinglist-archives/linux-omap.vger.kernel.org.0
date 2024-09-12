Return-Path: <linux-omap+bounces-2189-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0535C976247
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 09:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37F851C22F39
	for <lists+linux-omap@lfdr.de>; Thu, 12 Sep 2024 07:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8616A18BC19;
	Thu, 12 Sep 2024 07:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aucT0p/x"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219CA18BB9F;
	Thu, 12 Sep 2024 07:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726125006; cv=none; b=FdA9YK+8Xlx2tYp9XlyS8I4tvBhF7sEKoH8xeSNvvXNLFKYPZfIzg2B/22Qx1avTCW/UzJU4xgYkzw6hVQKSRrA+2Bbqarnz1mbbx+YvpPs0u55KXizU41/NdgwILZA2fv7lGwR4g165Ru+N08vXCHprONF6uOwCm7eSYnyL6HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726125006; c=relaxed/simple;
	bh=+gLvLfdyp4bLqikvOn8veZ3B7S/o5v/O2gpgkR67k7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtiSvKC5He5PtNOXT6jIE/j2bs9zV+kdyqppSsDhIprB5vH4PIJin4eICnyHPmbKNJ/fOPiuo7tZ/RrVjqFEro+5u7oRlX03O+JM2f7ybkdT4WpCdcuYikVbD0D4cO3gNeAwoQ8FcKwPkP1ZKqsy0ZHUNUExqj4wAUnJTbN2LkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aucT0p/x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A743CC4CEC3;
	Thu, 12 Sep 2024 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726125005;
	bh=+gLvLfdyp4bLqikvOn8veZ3B7S/o5v/O2gpgkR67k7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aucT0p/xV94KxcogYcRtdi/f2ySZFfe6jmK1bBYWAb8dbD+f2TjbC97iAw53w9/iA
	 nG5/FYLj0n8Srlp4y+bJIkR9oPWso4uVZpgsSU8HKa0aOTKhSeWgkyFDrsDEtsbzMt
	 Slbq27Aqgotz+CIJ59PwyyFkVg5WNASHiqPhp+Gsm1Ctso1L0JdrKtIM0wyuBavImC
	 VOWPdTNlYrKxCPIhTGVFzERCWhQNGjyfUqeX7rSJzPwEjpNP0ZriNvj4Z+CnNUPmMR
	 lpEJrCDegvAZGEceTBd6ieRKC1huCsEQYWnPtsNrMKydQ9n2PxMIUxVP3uOCjQ212+
	 Obc1hEtsNOg1A==
Message-ID: <27c12575-e670-4355-8d12-d5b544ec16f2@kernel.org>
Date: Thu, 12 Sep 2024 10:10:00 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: ethernet: ti: am65-cpsw: Use __be64
 type for id_temp
To: Simon Horman <horms@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: netdev@vger.kernel.org, linux-omap@vger.kernel.org, llvm@lists.linux.dev
References: <20240910-ti-warn-v1-0-afd1e404abbe@kernel.org>
 <20240910-ti-warn-v1-2-afd1e404abbe@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240910-ti-warn-v1-2-afd1e404abbe@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/09/2024 10:17, Simon Horman wrote:
> The id_temp local variable in am65_cpsw_nuss_probe() is
> used to hold a 64-bit big-endian value as it is assigned using
> cpu_to_be64().
> 
> It is read using memcpy(), where it is written as an identifier into a
> byte-array.  So this can also be treated as big endian.
> 
> As it's type is currently host byte order (u64), sparse flags
> an endian mismatch when compiling for little-endian systems:
> 
> .../am65-cpsw-nuss.c:3454:17: warning: incorrect type in assignment (different base types)
> .../am65-cpsw-nuss.c:3454:17:    expected unsigned long long [usertype] id_temp
> .../am65-cpsw-nuss.c:3454:17:    got restricted __be64 [usertype]
> 
> Address this by using __be64 as the type of id_temp.
> 
> No functional change intended.
> Compile tested only.
> 
> Signed-off-by: Simon Horman <horms@kernel.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

