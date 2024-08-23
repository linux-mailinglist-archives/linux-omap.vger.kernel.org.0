Return-Path: <linux-omap+bounces-1991-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F59A95CC47
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 14:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C9552860AF
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 12:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A9C185944;
	Fri, 23 Aug 2024 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="binSqo+M";
	dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b="bFIeFwX3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.mleia.com (mleia.com [178.79.152.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719419457;
	Fri, 23 Aug 2024 12:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.79.152.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724415745; cv=none; b=K2o+IUYmHMGGUuEOM5gZimJVF9klCZHiUiHF9gkkh26+FxZiVvUuZOFFFneFp5+HOmaVACP8tk9srkJDJL4SrA2CFycMCHV899rXx3q7bLb++wSzAAxIF2p4ucnfIObX3VgpKtSQfx538HFNv+gYn48IUp97eWg2p0ob1n8WLeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724415745; c=relaxed/simple;
	bh=DHLInO0Q0++CGrJpTS2lDxa8AaZBGIda748JPEd+hwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KnVxKCbE2nWZhrwhTOO4itthM18hSDrv0uPdEmLzAB5y5UMJaQ+WEzhqGEb1opvmsHGC/iuIVIIOTgs+5GobO0s9HpFkMfQqOJuiT9vAzMhQLCjzumZaSVBFDzmeN6JFzTwJE31H4FbW7kSuFAWh3Wn5hDejpPbMJY3CbRt97Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com; spf=none smtp.mailfrom=mleia.com; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=binSqo+M; dkim=pass (2048-bit key) header.d=mleia.com header.i=@mleia.com header.b=bFIeFwX3; arc=none smtp.client-ip=178.79.152.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mleia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1724415743; bh=DHLInO0Q0++CGrJpTS2lDxa8AaZBGIda748JPEd+hwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=binSqo+ME653gQPKz+Wf7tdHbjh4HEsl3qq3+nJ3GneWtQmbbohqR60hkcLUdhYVH
	 FSJfB0WnYmy/IaBgVbJUcFeNb7Ve7cEaCrVUc0WxoKJlRyDLMioV1B0RXOUEQyfsfJ
	 H09nUzVi2FgsBHkUnjChHvsL8//6SP2b8WyWaZboTKWmzSQaoQrcIUQeAT2Ie6VRLL
	 yYZblSS5KQeD91+WMcuLMZQbvy/qxZ3FKYZ+u06zL4G8Qd8xLX0i3rDTnrrVJxPwX6
	 KHHh9Ew1O1l/YO24NTF/UyshoC1S3odWbjrjzLPqzYFMv5uHyhNu3VaOgQwrk2Zk93
	 hWsyzdVORNEow==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id E9A1A133C;
	Fri, 23 Aug 2024 12:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1724415742; bh=DHLInO0Q0++CGrJpTS2lDxa8AaZBGIda748JPEd+hwQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFIeFwX3T2jslzJcO10w3wchWXcgtqqUdvDTguSa1y3bAVDuqAGEP//xAG3aLnVbh
	 sSYTfrp4i4p9VSJazGAyfEFHnyKnxxtXbEPPQ5l2TSS30rPrLnOagW0FH+FQaUZSm9
	 PzQICaG016h216qDYteTnExXh3kJBqRbcpQkWjJshVoeZfFCPiql6hS4XmSyh2WNbB
	 pJ4C49yzEYR5JEhXYITIFzIEGUBVdiTUmiE/Ljpk7hfK4HzEOEEduH39B5W/EI8Oji
	 vYJWd9DY5NLDtOWWxtRkYY7ETozVgrg56qWDYJn9zf+asfJyI2bj/CHjstksvbODsz
	 I5/UHE+rOe58Q==
Message-ID: <f8e1e6c4-4cc8-4907-bb31-c7ae434d4ee5@mleia.com>
Date: Fri, 23 Aug 2024 15:22:22 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] memory: pl172: simplify with devm_clk_get_enabled()
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>,
 Tony Lindgren <tony@atomide.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
 <20240823-b4-cleanup-h-guard-v1-5-01668915bd55@linaro.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-5-01668915bd55@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20240823_122222_991403_39EB03AA 
X-CRM114-Status: UNSURE (   5.41  )
X-CRM114-Notice: Please train this message. 

On 8/23/24 13:16, Krzysztof Kozlowski wrote:
> Use devm_clk_get_enabled() to drop clock prepare/unprepare parts and
> make code simpler.  Change to dev_err_probe() in handling clk_get_rate()
> error to make it even simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

