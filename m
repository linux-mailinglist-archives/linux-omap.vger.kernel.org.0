Return-Path: <linux-omap+bounces-4735-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C08DBBF99A2
	for <lists+linux-omap@lfdr.de>; Wed, 22 Oct 2025 03:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 479533AC222
	for <lists+linux-omap@lfdr.de>; Wed, 22 Oct 2025 01:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167F52A1AA;
	Wed, 22 Oct 2025 01:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGZ5zzxY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54BE225D6;
	Wed, 22 Oct 2025 01:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761096293; cv=none; b=PwDagooNZAEtHf3ysVwNGdnS3ob+V0PafywlEMEQ08bBGzogq8g9O+eNOq20nMbDkjjuVslCvdu36H1LGV0pL3KcI/Wv48jSGs7qd5vNSWh5OcgDNY/Rd31H1At20r12N9T3DsjqQPJnaOunDO2kIYR3Zdnx1c1ucv1xMK0IqIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761096293; c=relaxed/simple;
	bh=ImvvdbfzB6HTGA12tfQTbRUeE+HdGp/ZNkyQny1llug=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHCX2w04e1mu7kod/5KxxHkHq6cOeIyR3tIby/2UQIv15HEioGkXW+8UidV1AzIAvugyzUa4G+MzgrY5fafXKXmffQAy8CvpI1LfBZ4lo1yL5dtMG/28IIWWwI6gG1fvMjVc8E2KXGb3o7jOLFJ0RAu6TWih5CpyfMVen0IwY3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGZ5zzxY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EEDDC4CEF1;
	Wed, 22 Oct 2025 01:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761096293;
	bh=ImvvdbfzB6HTGA12tfQTbRUeE+HdGp/ZNkyQny1llug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VGZ5zzxYZvPAtVrAWFsClaxYAeADA/Uhr2baEI4iJxb9HWHEd0qIJP3IWqDSJIv0E
	 kKzQ6JSIkJBiB/SwhshQEPg98WpuIqUzl2KGbUfL/ejuKMqLDlEE/4Hn5tHjxBYdoj
	 WbiuVZxlVapHplXRCQc7k+tfHrWp7GS/TFxZuEaYRj9QO6/e8bRf2fbh6hlrqGXmAT
	 rDBbP1FkjiYdPx+I06NYiYbGO91Wf5MKdlNAobfrcPksGrVlycp8hkeVCUrpUs+vlO
	 MlhuN+AeQjB03VipQTpXTvPHARMAjWwN2a/C3fOcwP2fz8dFMMZdF3L48+df72QPdD
	 WzyUMni9dPiEg==
Date: Tue, 21 Oct 2025 18:24:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark
 Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli <s-vadapalli@ti.com>,
 Roger Quadros <rogerq@kernel.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, imx@lists.linux.dev, linux-omap@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, Russell
 King - ARM Linux <linux@armlinux.org.uk>, Paolo Abeni <pabeni@redhat.com>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 1/4] net: phy: add iterator phy_for_each
Message-ID: <20251021182451.33de59e8@kernel.org>
In-Reply-To: <7d33ee44-8558-40d9-b258-2942b2caf95f@gmail.com>
References: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
	<7d33ee44-8558-40d9-b258-2942b2caf95f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 17 Oct 2025 22:41:12 +0200 Heiner Kallweit wrote:
> +#define phy_for_each(_bus, _phydev)			\
> +	for (_phydev = phy_find_first(_bus); _phydev;	\
> +	     _phydev = phy_find_next(_bus, _phydev))

Wouldn't this better be called mii_for_each_phy() or
mii_bus_for_each_phy() ?

To an outsider and with PHY typologies it may not be
sufficiently obvious that this helper is used to iterate
a all addresses on a MII bus.

