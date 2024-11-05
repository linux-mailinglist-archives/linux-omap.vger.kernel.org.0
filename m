Return-Path: <linux-omap+bounces-2582-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA59BC22E
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 01:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2A991C21732
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2024 00:49:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484BC14287;
	Tue,  5 Nov 2024 00:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JAtNlfRE"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11FDB667;
	Tue,  5 Nov 2024 00:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730767761; cv=none; b=GGU4f60FodvECfPHNIP+rSdNNYxd21GtykjeEbDf/5f6KyGQBcS2xLiB3bZnUvY+czvWgZn6zeCc8Vv77hha4pVFJRnQynp41qlCekmHSSX1Uj6vwpKtms2VHZmnadt11rGTsml5ganT68vzl216qiH0lzCvV0JYlGesobOUwAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730767761; c=relaxed/simple;
	bh=WIqZTsHOsvR2cFhpx5SuKyMp6tJGa9n+Huix9B8qTm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8fPg0msWUISmTdmlq0ZoToOvwFszC7/lfs4j7r5VFHWKYhZEweaURgs3mHL/8s3O/zxCZAakq+i7RTZ3/9OzmXu/H3lAESoSH+jCtApM1Rhczj35Ti5/Tg3CBKUCXzjQFdHxLo3iNBefD8PPWu0kz2dLBy8LpY2AWSu6MKsXQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JAtNlfRE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F15FC4CECE;
	Tue,  5 Nov 2024 00:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730767761;
	bh=WIqZTsHOsvR2cFhpx5SuKyMp6tJGa9n+Huix9B8qTm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JAtNlfREYYQHlbtaxoOJUWP8Iq2IDfDC22EX7yDKjiMQf2n4lIjBPR3ZlEibVlNaB
	 GYzNgLSVCk7/gCV1ar8+cIUQtZE6fqr4uU2h3e6XLKPXBXfT1dqWhM9Qv4vLq/bZNB
	 RbOzzk91S+Ibel9U9LiZD3bbRAZTcVBWrGI8eVt/5DO3zEnNDo0sn1/y2Fa2JplG1G
	 IEI9N8vHGcoyz+nFGpZSMwixFPy8CoaCAoOwwu/UFa+N04vXZM4qIGsCXpRtaK8y5G
	 40iy0u7zMTCncyv7ik6mta9XvtWRwewhy+LakW/BCLfqloo3VhBupJfGw8ao+JJTIC
	 aQRUutQDlbEZQ==
Date: Tue, 5 Nov 2024 08:49:12 +0800
From: Peter Chen <peter.chen@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] usb: Use (of|device)_property_present() for non-boolean
 properties
Message-ID: <20241105004912.GA125226@nchen-desktop>
References: <20241104190820.277702-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104190820.277702-1-robh@kernel.org>

On 24-11-04 13:08:18, Rob Herring (Arm) wrote:
> The use of (of|device)_property_read_bool() for non-boolean properties
> is deprecated in favor of of_property_present() when testing for
> property presence.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/usb/chipidea/core.c        | 2 +-
>  drivers/usb/dwc3/core.c            | 2 +-
>  drivers/usb/dwc3/dwc3-omap.c       | 2 +-
>  drivers/usb/dwc3/dwc3-qcom.c       | 2 +-
>  drivers/usb/mtu3/mtu3_plat.c       | 2 +-
>  drivers/usb/phy/phy.c              | 2 +-
>  drivers/usb/renesas_usbhs/common.c | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 835bf2428dc6..18ecfcc08b97 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -765,7 +765,7 @@ static int ci_get_platdata(struct device *dev,
>  
>  	ext_id = ERR_PTR(-ENODEV);
>  	ext_vbus = ERR_PTR(-ENODEV);
> -	if (of_property_read_bool(dev->of_node, "extcon")) {
> +	if (of_property_present(dev->of_node, "extcon")) {
>  		/* Each one of them is not mandatory */
>  		ext_vbus = extcon_get_edev_by_phandle(dev, 0);
>  		if (IS_ERR(ext_vbus) && PTR_ERR(ext_vbus) != -ENODEV)
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 9eb085f359ce..e1beb760e913 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1935,7 +1935,7 @@ static struct extcon_dev *dwc3_get_extcon(struct dwc3 *dwc)
>  	struct extcon_dev *edev = NULL;
>  	const char *name;
>  
> -	if (device_property_read_bool(dev, "extcon"))
> +	if (device_property_present(dev, "extcon"))
>  		return extcon_get_edev_by_phandle(dev, 0);
>  
>  	/*
> diff --git a/drivers/usb/dwc3/dwc3-omap.c b/drivers/usb/dwc3/dwc3-omap.c
> index 2a11fc0ee84f..c2d7582c151a 100644
> --- a/drivers/usb/dwc3/dwc3-omap.c
> +++ b/drivers/usb/dwc3/dwc3-omap.c
> @@ -416,7 +416,7 @@ static int dwc3_omap_extcon_register(struct dwc3_omap *omap)
>  	struct device_node	*node = omap->dev->of_node;
>  	struct extcon_dev	*edev;
>  
> -	if (of_property_read_bool(node, "extcon")) {
> +	if (of_property_present(node, "extcon")) {
>  		edev = extcon_get_edev_by_phandle(omap->dev, 0);
>  		if (IS_ERR(edev)) {
>  			dev_vdbg(omap->dev, "couldn't get extcon device\n");
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index c1d4b52f25b0..649166e2a8b8 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -161,7 +161,7 @@ static int dwc3_qcom_register_extcon(struct dwc3_qcom *qcom)
>  	struct extcon_dev	*host_edev;
>  	int			ret;
>  
> -	if (!of_property_read_bool(dev->of_node, "extcon"))
> +	if (!of_property_present(dev->of_node, "extcon"))
>  		return 0;
>  
>  	qcom->edev = extcon_get_edev_by_phandle(dev, 0);
> diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
> index 6858ed9fc3b2..2380552025e4 100644
> --- a/drivers/usb/mtu3/mtu3_plat.c
> +++ b/drivers/usb/mtu3/mtu3_plat.c
> @@ -307,7 +307,7 @@ static int get_ssusb_rscs(struct platform_device *pdev, struct ssusb_mtk *ssusb)
>  	if (otg_sx->role_sw_used || otg_sx->manual_drd_enabled)
>  		goto out;
>  
> -	if (of_property_read_bool(node, "extcon")) {
> +	if (of_property_present(node, "extcon")) {
>  		otg_sx->edev = extcon_get_edev_by_phandle(ssusb->dev, 0);
>  		if (IS_ERR(otg_sx->edev)) {
>  			return dev_err_probe(dev, PTR_ERR(otg_sx->edev),
> diff --git a/drivers/usb/phy/phy.c b/drivers/usb/phy/phy.c
> index 06e0fb23566c..130f86a043ad 100644
> --- a/drivers/usb/phy/phy.c
> +++ b/drivers/usb/phy/phy.c
> @@ -365,7 +365,7 @@ static int usb_add_extcon(struct usb_phy *x)
>  {
>  	int ret;
>  
> -	if (of_property_read_bool(x->dev->of_node, "extcon")) {
> +	if (of_property_present(x->dev->of_node, "extcon")) {
>  		x->edev = extcon_get_edev_by_phandle(x->dev, 0);
>  		if (IS_ERR(x->edev))
>  			return PTR_ERR(x->edev);
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index edc43f169d49..e4adfe692164 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -632,7 +632,7 @@ static int usbhs_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->base))
>  		return PTR_ERR(priv->base);
>  
> -	if (of_property_read_bool(dev_of_node(dev), "extcon")) {
> +	if (of_property_present(dev_of_node(dev), "extcon")) {
>  		priv->edev = extcon_get_edev_by_phandle(dev, 0);
>  		if (IS_ERR(priv->edev))
>  			return PTR_ERR(priv->edev);
> -- 
> 2.45.2
> 

For chipidea part:

Acked-by: Peter Chen <peter.chen@kernel.org>

Peter

