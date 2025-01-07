Return-Path: <linux-omap+bounces-3013-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE2EA03EFE
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 13:23:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 253FB3A434B
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2025 12:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FB441E9B32;
	Tue,  7 Jan 2025 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tTWHqiE4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAFF191F66;
	Tue,  7 Jan 2025 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736252599; cv=none; b=da/srTnmOfKqtB/lzFLhEkK4cadLivk1UVTkXB1vWxrO94yzVO4SNgTnjIlAbVJKeBdDnfNDkyOQge1W7H1r+pj2zqRZAU2RMs+ezIyZlWLazFsA0+KqYjQ5n1TXUjVwnlaXBXhqfRvZOa9wJU5KXvcH1Hvo/uLIbqcRj6jqV38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736252599; c=relaxed/simple;
	bh=EPrz6ij99u9REIPhH7cQ24cjgsgplo+9F2xBXcrNItw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SEZLdlFn7NeImfV9EWtB3WuLaFA+KtRIj5cqsfvCwB26xgdFoOLAl3K7houi7VVKft494w5EkWduXAEFDNBOkNrKSpNYKhV1G+3SCsnXivuHqaFijp5VQleYKBBykI4F43NoXwhrD7iOLYBK/Yd1IEVi9TDP8OTsHRbmtstiwfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tTWHqiE4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EC3C4CED6;
	Tue,  7 Jan 2025 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736252596;
	bh=EPrz6ij99u9REIPhH7cQ24cjgsgplo+9F2xBXcrNItw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=tTWHqiE4oFNt4/T99K7ewx+Ai3sZlbIFlqSRtSSomSMdNtU6grieT3vLkm1DX9V4C
	 wfE3lZXwVadgVlPYwF3pF71/RVKVCW0ymTELQ8BmZnpn6Ha/9VDoQ55bMZNfdbNztE
	 4eM05/FZ7q0uA/cuXX0If1k+Ez+hr+vVGKBhTvvpUkobPyLhRIV1f7jXXTuUtRsVyt
	 +r+aYJYUjKjH06R8HpRxMzcqM7BNt0rqurbTpy1Z8B6YhHzuZBugVgID2pZh7t146Z
	 DxIzMTFAG+LgoTMko617qqUZZ+MisfRMUqiLwuKbZ8YT919ZZ4TRsh4LilhCi9jbIz
	 I9dLOpuoVaZNw==
Message-ID: <c43e2888-d8b5-4ce4-ade4-48964a8e073f@kernel.org>
Date: Tue, 7 Jan 2025 14:23:11 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: ti/omap: omap4-serial: fix interrupts syntax
To: Andreas Kemnade <andreas@kemnade.info>, tony@atomide.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com, aaro.koskinen@iki.fi
References: <20241230195556.112118-1-andreas@kemnade.info>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20241230195556.112118-1-andreas@kemnade.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30/12/2024 21:55, Andreas Kemnade wrote:
> Usually interrupts are overwritten in the board file to specify a
> mux-dependent dedicated wakeup irq, so there is interrupts and
> interrupts-extended property which is not allowed. That has generated a
> lot of noise during dts changes if just a phandle involved has randomly
> changed.
> 
> Avoid that mess by specifying interrupts-extended in the dtsi file.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/linux-omap/173558214240.2262575.18233884215338168789.robh@kernel.org/
> Closes: https://lore.kernel.org/linux-omap/172784021601.525825.18405282128990798038.robh@kernel.org/

Reviewed-by: Roger Quadros <rogerq@kernel.org>


