Return-Path: <linux-omap+bounces-48-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D339E7FB66D
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 10:58:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58005B217F5
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 09:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05DF04C3AA;
	Tue, 28 Nov 2023 09:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="AYmiUMy8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69068DE;
	Tue, 28 Nov 2023 01:58:18 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 5F8CB60871;
	Tue, 28 Nov 2023 09:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701165497;
	bh=tQeGP10H+YEMxkuCC5ZqSkRKdCu2iitVcPgC9MNPInw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AYmiUMy8dYEV7WMSG8R47pS4cwSRZGb57lAqPqzGSy1KN/QAHCmrBq77dhO37/XIw
	 92e7Y96w9hEDK3crftRvhDeItlLEFq+QLOaPxBOzdf/UFxE31G3OXrAEMcez6AYv/H
	 DMM/MEcax9+vqpHEm+fuperg9bltVq44y7oQ8n34Fl7ToXsJ+mFxDRg+8pk6l1XWQd
	 jhaBkRij7yW855egwUrCkrN150vnaUckxwGUCr6jHcfPkvBzjMTNENanSimwgl908r
	 i31l3fYuxM8nzegFXrLWQ98WupHJWl+/Q9tw/Vx+52mUveW7aYfX1EG/scSbq5RPLf
	 X9wK6/D6/shUw==
Date: Tue, 28 Nov 2023 11:57:26 +0200
From: Tony Lindgren <tony@atomide.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-mediatek@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 2/6] ARM: dts: ti/omap: Replace deprecated
 extcon-usb-gpio id-gpio/vbus-gpio properties
Message-ID: <20231128095726.GQ5169@atomide.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
 <20230724103914.1779027-3-alexander.stein@ew.tq-group.com>
 <10373360.nUPlyArG6x@steina-w>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10373360.nUPlyArG6x@steina-w>

* Alexander Stein <alexander.stein@ew.tq-group.com> [231117 12:08]:
> Hi everybody,
> 
> any feedback on this? Patch 3,4 and 6 have already been merged.

Sorry I did not know I'm supposed to pick it from the series.
Applying into omap-for-v6,8/dt thanks.

Tony

