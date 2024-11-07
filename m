Return-Path: <linux-omap+bounces-2608-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F119C0604
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 13:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E7B21C21369
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 12:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A62AF20F5B9;
	Thu,  7 Nov 2024 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="WQyU9E81"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9BF20E335;
	Thu,  7 Nov 2024 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730983317; cv=none; b=MJ0hvIrLZD2trTV+/Auaqw9MisKPlF5jiTZxLyWU7bwLSTmqVam5cl2COaShCzANFclIkQ43twOSPkaJfViUnQ082n6AnZlYploXi+x7RMjQrWHSqLoOJTs42K6DPJs68N4Dc7Krb0cdu9XnauIrc+2VJVVH9vmUsrSgiXl3/vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730983317; c=relaxed/simple;
	bh=3z3+QfGI0GHXkFohB/2+5nHZPe33l3ZnXYyq6u7Qw/s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HDUtodjQana2OTZbfB7t0ralA8SL+d3YmJ8gOnpS+UsMk5RJScOUISyY/5O3Y9oWTE5e2faUONd/DETMxkwZ3OlqKl7ho6/nirUkyLfyDemyM+p5QVpexDG3AoBYxOgvryum8ZszypnEw+0u2RIKfB/CkLkiEB/S/Q4OqbU/tx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=WQyU9E81; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A7Cfj7V088935;
	Thu, 7 Nov 2024 06:41:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730983305;
	bh=5Y1U5b2zohFgC/mH/3a5ysLFMGEuDJxMPIL691Cft8I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WQyU9E814Ev9Q5oosc9FC988fSZu1JrM7dxIPkbyTsAt47vbPUEyf5dKMjSAR9J0B
	 gyyXSj8OBBPbtnC8E8n29J2tDUtAa2wJBASrWiFhCoZTripFsIGAS2kHkV89aY7zEd
	 puxiZUk0BmUzJdWvWnF837cj/p8tX2ni0RqzFKBI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7CfjMU094652;
	Thu, 7 Nov 2024 06:41:45 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Nov 2024 06:41:45 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Nov 2024 06:41:44 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7CfhIU028223;
	Thu, 7 Nov 2024 06:41:44 -0600
Date: Thu, 7 Nov 2024 18:11:43 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Roger Quadros <rogerq@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        <linux-omap@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Pekka Varis <p-varis@ti.com>
Subject: Re: [PATCH net-next v2 1/2] net: ethernet: ti: am65-cpsw: update
 pri_thread_map as per IEEE802.1Q-2014
Message-ID: <55e4c76b-3e11-4681-be22-e7122435943d@ti.com>
References: <20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org>
 <20241107-am65-cpsw-multi-rx-dscp-v2-1-9e9cd1920035@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241107-am65-cpsw-multi-rx-dscp-v2-1-9e9cd1920035@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Thu, Nov 07, 2024 at 02:29:29PM +0200, Roger Quadros wrote:
> IEEE802.1Q-2014 supersedes IEEE802.1D-2004. Now Priority Code Point (PCP)
> 2 is no longer at a lower priority than PCP 0. PCP 1 (Background) is still
> at a lower priority than PCP 0 (Best Effort).
> 
> Reference:
> IEEE802.1Q-2014, Standard for Local and metropolitan area networks
>   Table I-2 - Traffic type acronyms
>   Table I-3 - Defining traffic types
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

