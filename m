Return-Path: <linux-omap+bounces-2638-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF9E9C2BCB
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 11:31:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67A851F21F03
	for <lists+linux-omap@lfdr.de>; Sat,  9 Nov 2024 10:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4EB1474BF;
	Sat,  9 Nov 2024 10:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4hhXxCx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23423233D73;
	Sat,  9 Nov 2024 10:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731148291; cv=none; b=KPIASLuQxxyu4fYmAVplgaEv6khNvOTjd1aMu8ujax+y3+p9bUJ48R3/ABTyWcTiIyjKj9QR4s2rzoEXHeCrO9QomwC/CCUFv04EqKX0Wedfgp9F4v5ZzwTcxdcv9D1heoyMt3LPn1WQeja207a4cC7e3H0af2Xa3KkH1qobtMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731148291; c=relaxed/simple;
	bh=6pyqUr8th9ddI6Eqft8DcKhMA5ky+3YN8nR+Ppc3Xx8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PS6dw573+I7PQqU//QqRJ+vWiAQzYQO3e7pICAcG6r8RTy3JCwmvmeZKszuBXkas6jCK+fi8AMljENWejRatP1kK1Rdv5uveVcmWjQ5D3bZn0eKpn3l0bLL3opeQda10ns+HzQ5kOx3WiEXEWCG/z3nQQ2Wyqqxf4Hu/19vi1x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4hhXxCx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D10B0C4CECE;
	Sat,  9 Nov 2024 10:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731148290;
	bh=6pyqUr8th9ddI6Eqft8DcKhMA5ky+3YN8nR+Ppc3Xx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f4hhXxCxG1oB85pm05mx9rkth6Qns51yaCAsuq/4H8J1zY76u+PytmOzrVJPyc//Q
	 Y87nrI+Nl+HR8xa/6qmfZpZLIZCkCdIF6uO9gusrZyjsBaTBrok+kRKtLxsv2SRq3D
	 xcJj+pqVFHiqJmeNu3xRbURlogas5HfwK5o792Xgw1jQ3bva/HChXCKOmpG9iAVTNT
	 f9ZByKVUq3digjQhmx4KVlFYjV5t0JKNA3RrMVLsTcEZkvremIygVz3JIgOF1LZP4M
	 p5+tXeu6YdKQz95AmiiTVyax2tiTTIfnxUDUftxEF3KtptzNkGpTV747uw6PmXfyyu
	 zzOB2HOxsbMjA==
Message-ID: <73f8d7a9-59ef-4d54-a024-4cf99d60abc0@kernel.org>
Date: Sat, 9 Nov 2024 12:31:24 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/2] net: ethernet: ti: am65-cpsw: enable DSCP to
 priority map for RX
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, srk@ti.com,
 Pekka Varis <p-varis@ti.com>
References: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
 <20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org>
 <8e6053ca-77fc-4f03-ae54-3f6af0addb88@ti.com>
 <7ae1ccf9-67c0-45ba-9cb9-886701adb488@kernel.org>
 <208a1472-c69b-4c20-9bb2-25158edfd7d8@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <208a1472-c69b-4c20-9bb2-25158edfd7d8@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 08/11/2024 16:42, Siddharth Vadapalli wrote:
> On Fri, Nov 08, 2024 at 02:55:18PM +0200, Roger Quadros wrote:
>> Hi Siddharth,
>>
>> On 08/11/2024 14:30, Siddharth Vadapalli wrote:
> 
> [...]
> 
>>>> +#define AM65_CPSW_PORTN_REG_CTL			0x004
>>>
>>> nitpick: indentation needs to be fixed here to align with the macros
>>> below.
>>
>> It is fine in the code and in my editor in this reply email.
> 
> That's strange. But it appears the same to me as seen at:
> https://lore.kernel.org/r/20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org/
> where the indentation looks incorrect.

It is probably editor specific. There are in fact 3 tab spaces to align it
with the number.

Can you please apply the patch and see if it is OK in the code?

-- 
cheers,
-roger

