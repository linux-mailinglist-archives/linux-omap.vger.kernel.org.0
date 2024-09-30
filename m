Return-Path: <linux-omap+bounces-2265-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA2398A6A2
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 16:08:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C0691C20977
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2024 14:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61BED190075;
	Mon, 30 Sep 2024 14:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qP8RpTzd"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013A1433B6;
	Mon, 30 Sep 2024 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727705285; cv=none; b=t7lnEeSL7E+FgPkpT39l42QKaNKLfKNVTXndcECaBx9Epn2G6804UXRwaSHEh4ZwcL/s39DbezPb5tXaSk/ndQhvzslUdznT1SHzQIBmRHMAmY8dbNoYFSRzFtyFtWI9xbNOjJF96Y3suJ5Ms3AT5zd21gX72QuEgRmuFL7b86M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727705285; c=relaxed/simple;
	bh=W2U1pC6An35U2FQHTZotmd+ty3Noyou45ahQIT3vrYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ua3YUp+YA/X4aXSuOY30soRCfX6Yubx2rj3yy7XrUzTCgVrOGepg+2h+RTRHt0i0ga6cJQsQdZjy+Idpw0xcy4dEFjVXSODhmcoOu18txNt4Y4+CSXuIJmPPeWwq8F64SWiKPv6QMXibCxOp0kkVe3e3Lc1MTw3dqs4YZMiKVvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qP8RpTzd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23CBEC4CEC7;
	Mon, 30 Sep 2024 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727705284;
	bh=W2U1pC6An35U2FQHTZotmd+ty3Noyou45ahQIT3vrYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qP8RpTzdQtQA9oJLKDce2L6dkQeOORR7hQXgQst1nTgj1/0aXYs6flCmybBoe0jfH
	 EpcBdlnRzuz4Y1659XJeIjbPfxyP4MCOUHDSP9qcf2tMAd/FC263GUorqMs11UTF5H
	 nW50NXpTUHr+erQDVSc5JR1IHGGu6QMxGocFCsxWTunFERAelMO7Of4Uwm0RyRw1lx
	 7tAF9UrbDjb/xyYedKHwUg2+hM+bj9vBYGhP+5EdNQhkwGBDaMT3obrlvxO7+1rrKd
	 22Zhbz4A8ZUiWjLsFlyOWSk4N2oDQxojFUTr8xT1AQeneolwQxd/om3J3feoMDq1EB
	 VURhI8FY/2/QA==
Message-ID: <282af31b-5682-4ff0-8247-03d3079ee86b@kernel.org>
Date: Mon, 30 Sep 2024 17:07:59 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/35] ARM: OMAP2/3: PRM: Reorganize kerneldoc parameter
 names
To: Julia Lawall <Julia.Lawall@inria.fr>, Paul Walmsley <paul@pwsan.com>
Cc: kernel-janitors@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
 <20240930112121.95324-2-Julia.Lawall@inria.fr>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240930112121.95324-2-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30/09/2024 14:20, Julia Lawall wrote:
> Reorganize kerneldoc parameter names to match the parameter
> order in the function header.
> 
> Problems identified using Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

