Return-Path: <linux-omap+bounces-1383-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D278C8251
	for <lists+linux-omap@lfdr.de>; Fri, 17 May 2024 10:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C7BA280D33
	for <lists+linux-omap@lfdr.de>; Fri, 17 May 2024 08:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 250911A28D;
	Fri, 17 May 2024 08:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iOtMg36h"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B626F17C69;
	Fri, 17 May 2024 08:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715933153; cv=none; b=PYFYNyql2H59IKNMFS8r8MDGA+dc3nsEOVz/S7bfRVLp8QMdHDkQUIqd0wTticVf6OBgvLLW4G6PTWCVxJ4lSLD2d4P8tzJZ/rOT/p7NcPfEV7KEJZU0SDwdGbuu4gCSH7aDRtebGGUta3oi1S4AZ07s2FYPX/NGUBNhVtWXsRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715933153; c=relaxed/simple;
	bh=wyUDUgKQT7GU3hDhxjsn94yEfi6h+TRBgdQAWb1F/YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwYazK4o1hoL+QSjnFTw8NPZn9MO9cuypIFk3k0byR6RywJxRn26s6tvRZkNPpULzHsAac0D297ccikUfv+ED8BAzAYzgciYXpyAFKsdLVZyjPW4jeYkwXf3dREYvJK/aSaKrgOAzgVJBCDYgxk4Pz7uvSYnTJ6hRw+eei3c9D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iOtMg36h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18E72C2BD10;
	Fri, 17 May 2024 08:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715933153;
	bh=wyUDUgKQT7GU3hDhxjsn94yEfi6h+TRBgdQAWb1F/YA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iOtMg36hKj8pTz8RXaEAMeEIuKZJRqX1xQvRPqQ+1FyDJ5M9oT1OBFe5KL4BmIZpJ
	 H3rU0zhWZzlFmdyPlNkyI68z9MJp1Bphwd8VRftIclBxsqYtnwh+JiU3fKUChiZgqI
	 WYYe3ZnAXeRjIBQD2OM7H6UdTJV1SDnVv+tqTDeuyoGOdnj7iOX3LOq84Ji+SPiCPQ
	 vKFlzy87y1T2uflqe8aPubvKM+IofKAMbocrUOG0a2O6I7gg3dMD7nTohFw0AG9qFQ
	 puLOEecmkswuExshB4xZ5+RwWO6BA/6KFu1YJa1KLAIqB6yF/wyz0KkGt0OWfO+/KE
	 CUxrSeHK7wWOQ==
Message-ID: <abf53395-f3eb-4082-8b57-5cc672c75060@kernel.org>
Date: Fri, 17 May 2024 11:05:49 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: net: Update reviewers for TI's Ethernet
 drivers
To: Ravi Gunasekaran <r-gunasekaran@ti.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 s-vadapalli@ti.com
References: <20240516082545.6412-1-r-gunasekaran@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20240516082545.6412-1-r-gunasekaran@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 16/05/2024 11:25, Ravi Gunasekaran wrote:
> Remove myself as reviewer for TI's ethernet drivers
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

-- 
cheers,
-roger

