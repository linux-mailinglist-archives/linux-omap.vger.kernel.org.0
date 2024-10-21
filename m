Return-Path: <linux-omap+bounces-2463-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB009A6072
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2024 11:44:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A964BB2A418
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2024 09:43:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321331E283D;
	Mon, 21 Oct 2024 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="TT11sIJs"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CA11E2832;
	Mon, 21 Oct 2024 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729503773; cv=pass; b=nJoUSEo6MzNe8pgxhHozUR3VoMJTwLkvBIXLeP/XR6OWZoREIFUACvweacVMm8/Z24HEmmVkdkYTuGzz0HseADmoPusi/GtKTYQ1Bw2FC8xrMsrTptNQ4vbNZannhWG9Kqx/pPxEGY7UUJAxfDLantNgDiW4mPPerEOqAWfCAGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729503773; c=relaxed/simple;
	bh=Dgn4BIMgi2uJUo6HDYEO3rNdBm10LDPvAFVEi4WVIJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dhjV60mdbu0ZO/bAtMSo8kxUsx4CrTMiMvQdHPoVzm0YvSnxe685nVhS6prbAjs6FEYnVpduRejwMpitydPMCv1Qnszo8ECzbsN1WNHDKudnln/TDJYcDL6WUJB+M9GMOMe+c4eFy7fICJuNhcuCVjw3nzJjI3E/8jXwvdW4V+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=TT11sIJs; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4XX9Mh1c2kzyS6;
	Mon, 21 Oct 2024 12:42:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1729503763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iItfBry1csHzGqUNbyVvEH2vzYvKChbmjbYESjm867M=;
	b=TT11sIJskyRx4EEr+KaB1vS9ZH1SrCpLkOsmpLXhV+msJ8nnG/c+KvasmmZkysT/XmnZSF
	yzI1WuUO2SX3wT0J+rpBDVKiWNTyzy+UbHSQOIEjaKqHupcEcstRyggRrZ89bJ/pCW6MjT
	E1gF2WbPBegINFg/pG7UZVa227DDmg8=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1729503763; a=rsa-sha256; cv=none;
	b=dAu7+pIdIlghojNCKKb7WLzQDsJuVijf/a7ZiZcBa3UA0XHPe/kht+wAwuGAtiUGqpd4Te
	LfWGHY+l6PAYM9iVxr/PvQS7IEAJYX2426q2duOLHAS+HnQV5/TLv/P2PjNAInD2SIs2mA
	VmHE41wmRy6Gy3+u9bU6C4EA22IgZbk=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1729503763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iItfBry1csHzGqUNbyVvEH2vzYvKChbmjbYESjm867M=;
	b=bVCLNoC2TXGV7eAh0a6ceMJHIaPpJJU1ZaP4jA0ZfxVTtkfzdDdnxcM0fVFHXDiBvvll/R
	NYiTURklrRn0pW+Wj4zdDxekI5VlHJkikY5JLAyrUcNxC6Kac8dWOivI6OMsfq/uZ4Fr52
	R79/Djv0r4sJdwZfbt0SWAbsfKTtT4A=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id 6DC52634C93;
	Mon, 21 Oct 2024 12:42:39 +0300 (EEST)
Date: Mon, 21 Oct 2024 09:42:39 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/9] of: property: add of_graph_get_next_port()
Message-ID: <ZxYiD5CCzcrwbD1o@valkosipuli.retiisi.eu>
References: <87wmiirqwy.wl-kuninori.morimoto.gx@renesas.com>
 <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v7y2rqwf.wl-kuninori.morimoto.gx@renesas.com>

Dead Morimoto-san,

On Wed, Oct 09, 2024 at 01:44:48AM +0000, Kuninori Morimoto wrote:
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 11b922fde7af..6a5d27dd0c64 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -630,6 +630,43 @@ struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
>  }
>  EXPORT_SYMBOL(of_graph_get_port_by_id);
>  
> +/**
> + * of_graph_get_next_port() - get next port node.
> + * @parent: pointer to the parent device node, or parent ports node
> + * @prev: previous port node, or NULL to get first
> + *
> + * Parent device node can be used as @parent whether device node has ports node or not.

This line should be wrapped, no reason to have it longer than 80 chars.

Maybe this could be done while applying?

> + * It will work same as ports@0 node.
> + *
> + * Return: A 'port' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */

-- 
Kind regards,

Sakari Ailus

