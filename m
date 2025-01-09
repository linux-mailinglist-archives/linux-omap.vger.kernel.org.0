Return-Path: <linux-omap+bounces-3040-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9743AA0722F
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 10:54:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2E073A3760
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 09:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8396E216607;
	Thu,  9 Jan 2025 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l4TuiHR3"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD3F215187;
	Thu,  9 Jan 2025 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736416218; cv=none; b=bZ9uNKfdk7Jamv8dw3ULv/rKBiAQzr0NXdrHeCIUk9w4UJhUFzX/GqRJO2Lqi8MuyaOJUKB/Z9koV+YZrRcL71FtDsYHdOL+a1N3H/RfMKmKoh0kWB6w6TMG3JmtGMliKrfhG/k2CKFO9DD75WQd8h5XoL1l2YfoF2cH+h8brmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736416218; c=relaxed/simple;
	bh=zp5/hDQC56VmrexKi/bXZ6uxoywNgkow9SECgQEPQDg=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KpOTd0yFajXZyL/8kM8UTFPxKgf8pReSi3bRkSZOVqXlSYAFrP+XrfAqrwjhietMFbbo2bx47v9RuC3YEFrbDbKUGXDDmETjdtZStn3jNXJqZpw9pTdggLKVFmrVelzZcI7T/DukHtphoZNpJ27dGY6AE/3P871+IbOQAdYDmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l4TuiHR3; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5099o4WN2945265
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 03:50:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736416204;
	bh=kd/VHkxSJu3Kcdx79ArcYcO/kfDtOE57gL4UIgcLhdQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=l4TuiHR3kIkxVXP7R+v8S9FcdEs9FabK5L65UiDjKssnMYgBbk/VAbiyOdyCiQ6X9
	 a+IAYqUHLoFWESoRzX/o8gfhH1EuhSrs+BopzKcW1c0usnfkQxA5Ld1AgdZd1Kamg/
	 PT48EKH/u34oMpR8wtFl5sgqMQg1SrwOOg7MadzM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5099o4I3090342
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 03:50:04 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 03:50:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 03:50:02 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5099o1CI120259;
	Thu, 9 Jan 2025 03:50:02 -0600
Date: Thu, 9 Jan 2025 15:20:01 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Sudheer Kumar Doredla <s-doredla@ti.com>
CC: <s-vadapalli@ti.com>, <rogerq@kernel.org>, <andrew+netdev@lunn.ch>,
        <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
        <pabeni@redhat.com>, <horms@kernel.org>, <gnault@redhat.com>,
        <linux-omap@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <t-patil@ti.com>, <j-keerthy@ti.com>
Subject: Re: [PATCH v2 net] net: ethernet: ti: cpsw_ale: Fix
 cpsw_ale_get_field()
Message-ID: <i5ci3h2vjkv7tuer3lq3l6f23mfouvq5csipfbycra3hak56e6@6vhnnq7xmabo>
References: <20250108172433.311694-1-s-doredla@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250108172433.311694-1-s-doredla@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Wed, Jan 08, 2025 at 10:54:33PM +0530, Sudheer Kumar Doredla wrote:
> CPSW ALE has 75-bit ALE entries stored across three 32-bit words.
> The cpsw_ale_get_field() and cpsw_ale_set_field() functions support
> ALE field entries spanning up to two words at the most.
> 
> The cpsw_ale_get_field() and cpsw_ale_set_field() functions work as
> expected when ALE field spanned across word1 and word2, but fails when
> ALE field spanned across word2 and word3.
> 
> For example, while reading the ALE field spanned across word2 and word3
> (i.e. bits 62 to 64), the word3 data shifted to an incorrect position
> due to the index becoming zero while flipping.
> The same issue occurred when setting an ALE entry.
> 
> This issue has not been seen in practice but will be an issue in the future
> if the driver supports accessing ALE fields spanning word2 and word3
> 
> Fix the methods to handle getting/setting fields spanning up to two words.
> 
> Fixes: b685f1a58956 ("net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()/cpsw_ale_set_field()")
> Signed-off-by: Sudheer Kumar Doredla <s-doredla@ti.com>
> Reviewed-by: Simon Horman <horms@kernel.org> 

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

