Return-Path: <linux-omap+bounces-69-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE7B7FEBF7
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 10:37:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4D1D1C20D9B
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 09:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB44538FAB;
	Thu, 30 Nov 2023 09:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oy31iWsg"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EEF374FE;
	Thu, 30 Nov 2023 09:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F25CC433C7;
	Thu, 30 Nov 2023 09:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701337044;
	bh=TdOMiWgyf8Im0dkTqa/TXaHjrcnnjfKxi4zDQeu8+8k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oy31iWsg/BvtZqwVftGSxWpwmavoIQ1dGb2EtYU6cFNhPEEzHf8HGfP8J2G8PSNGa
	 Z75spsTFGNbhDM80rOjKV4thULtSLGiPZ0tt7u01KHVxLiAmVadI3jz5RGesZVjo0c
	 Q6qZsrbHG0DT39uub/HnPp+iQXhnuBSakYSiUaj50ZSJvoWPx9lbl/QvAK5CFoeKRA
	 cqR/DF42R8mNgUGTt3iRN8rGukXPVPCF/Hql/JZyp0/2f425UPYhvtBQzF38cJ3f13
	 lU9PgilP61kSikJBOjPNaYDSlwVETNuOHQsbz+pPR5STKvSvXrG0YnMw++x9F0uGv5
	 +wv91b2lyGtPA==
Message-ID: <1918d6ca-73e6-445c-8cdd-7b5a70b9e762@kernel.org>
Date: Thu, 30 Nov 2023 11:37:20 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/4] net: ethernet: ti: cpsw: Convert to
 platform remove callback returning void
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
 Ravi Gunasekaran <r-gunasekaran@ti.com>,
 Jesse Brandeburg <jesse.brandeburg@intel.com>, Rob Herring
 <robh@kernel.org>, Yunsheng Lin <linyunsheng@huawei.com>,
 Marek Majtyka <alardam@gmail.com>, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, kernel@pengutronix.de
References: <20231128173823.867512-1-u.kleine-koenig@pengutronix.de>
 <20231128173823.867512-3-u.kleine-koenig@pengutronix.de>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20231128173823.867512-3-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 28/11/2023 19:38, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Replace the error path returning a non-zero value by an error message
> and a comment that there is more to do. With that this patch results in
> no change of behaviour in this driver apart from improving the error
> message.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Roger Quadros <rogerq@kernel.org>

