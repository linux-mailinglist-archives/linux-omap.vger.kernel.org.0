Return-Path: <linux-omap+bounces-5321-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 30862CF4C28
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 17:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 469F531055C1
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 16:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6DD0305045;
	Mon,  5 Jan 2026 16:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wfyASmZY"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CA5285C89;
	Mon,  5 Jan 2026 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630157; cv=none; b=dkksun5M2Jyol5l9ICIevNuHbKUr4gf8RCHIcS+jDgqzS+qCoKrdnJDPTEyugQ0F+D6HkBJq7iHsAc95WjIq8VYC0yiaTMKHQ2mWVBUHA6M385HJ7t0UzxCC8E8TGOPxjz9O4cY/cu/zxTx0pMr3qKI5pECfk46vZte8piQNUsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630157; c=relaxed/simple;
	bh=AxcR+Fylwqh1PgJgCyR6seeSRnJV5hh0ert8Q7FFt7M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mFyG46WmNZcezWyPDOZBAf3sp0PAsPVyRnMO5PkN4rsCQdGMn/+C6SPmeN1Qa9XHd0FkIfDG5AnWO+aLG6uEx81G0dVCuP6QcB9l16GK19vqz+4EH+TJrY9ybXImskoE8r1LkRkrFrAIU9rqyhDCb/TutFqW/VL+P0Wjsh3jLSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wfyASmZY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2BEC64E41F7F;
	Mon,  5 Jan 2026 16:22:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F102A60726;
	Mon,  5 Jan 2026 16:22:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 362D1103C8581;
	Mon,  5 Jan 2026 17:22:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767630151; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MASj0+5F+BhI0O8zz8NrhU8cFe/vl+IgpIDneI/8zCU=;
	b=wfyASmZYAXZDOEI9ogI1szLZusLvXiw3hq/bBEIuPMHGAjW+PCHy4rELj73K3KzyrFrPZO
	TEDzqz/Jr0x2JkdZiTTpfWBWBg0MGxmkkTPmKMe3FN+aQpm7fIf1Ak/W1lkcc2AhEY412W
	dI9HvO5+bzTPhEB/eVPG48ldJ+aYfLHrdN1e2Le4vOqajsUib3r4MaJXsa3t0RYt0yOF9k
	N73Cb6I252QKdqNZ/QkqD2c5Yk/imngKg/nIoGC8nsKA1bNlLZgkrC9UXjwo3HVf0rGzxS
	wHPP0PRX/alh9zs6FQdYIus8qT+KGVSoOk1unbSanDxfmERwOeLe0yu8SM3Lfw==
Date: Mon, 5 Jan 2026 17:22:20 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com> (by way of Kory Maincent
 <kory.maincent@bootlin.com>)
Cc: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Markus Schneider-Pargmann" <msp@baylibre.com>,
 "Bajjuri Praneeth" <praneeth@ti.com>, "Louis Chauvet"
 <louis.chauvet@bootlin.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 05/20] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260105172220.2d2edd28@bootlin.com>
In-Reply-To: <DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
	<DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Luca, Kory,

On Wed, 17 Dec 2025 15:23:26 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> (by way of Kory Maincent <kory.maincent@bootlin.com>) wrote:

> Hi,
> 
> Cc: Hervé, can you review the DT overlay aspects?

Yes sure.

Here is my global review.

Depending on the discussion on things I have spotted, I will go deeper in
patch details.

...

> > +
> > +static void __init
> > +tilcdc_panel_update_prop(struct device_node *node, char *name,
> > +			 void *val, int length)
> > +{
> > +	struct property *prop;
> > +
> > +	prop = kzalloc(sizeof(*prop), GFP_KERNEL);
> > +	if (!prop)
> > +		return;
> > +
> > +	prop->name = kstrdup(name, GFP_KERNEL);
> > +	prop->length = length;
> > +	prop->value = kmemdup(val, length, GFP_KERNEL);
> > +	of_update_property(node, prop);

I would use OF changesets to perform the modification.

OF changesets are kind of atomic. You first prepare all modifications in a
changeset and then you apply the changeset.
If something goes wrong, the changeset is removed.

Also, if something goes wrong during the changeset preparation, you can abort
without any modification on the live device-tree.

> > +}
> > +
> > +static int __init tilcdc_panel_copy_props(struct device_node *old_panel,
> > +					  struct device_node *new_panel)
> > +{
> > +	struct device_node *child, *old_timing, *new_timing, *panel_info;
> > +	u32 invert_pxl_clk = 0, sync_edge = 0;
> > +	struct property *prop;
> > +
> > +	/* Copy all panel properties to the new panel node */
> > +	for_each_property_of_node(old_panel, prop) {
> > +		if (!strncmp(prop->name, "compatible", sizeof("compatible")))
> > +			continue;
> > +
> > +		tilcdc_panel_update_prop(new_panel, prop->name,
> > +					 prop->value, prop->length);
> > +	}
> > +
> > +	child = of_get_child_by_name(old_panel, "display-timings");  
> 
> There's some housekeeping code in this function to ensure you put all the
> device_node refs. It would be simpler and less error prone to use a cleanup
> action. E.g.:
> 
> -	struct device_node *child, *old_timing, *new_timing, *panel_info;
> 
> -	child = of_get_child_by_name(old_panel, "display-timings");
> +	struct device_node *child __free(device_node) = of_get_child_by_name(old_panel, "display-timings");
> 
> > +	if (!child)
> > +		return -EINVAL;
> > +
> > +	/* The default display timing is the one specified as native-mode.
> > +	 * If no native-mode is specified then the first node is assumed
> > +	 * to be the native mode.
> > +	 */
> > +	old_timing = of_parse_phandle(child, "native-mode", 0);
> > +	if (!old_timing) {
> > +		old_timing = of_get_next_child(child, NULL);
> > +		if (!old_timing) {
> > +			of_node_put(child);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +	of_node_put(child);
> > +
> > +	new_timing = of_get_child_by_name(new_panel, "panel-timing");
> > +	if (!new_timing)
> > +		return -EINVAL;

Here, for instance, you have already modified your live tree and you abort the
operation. Your live tree is somewhat corrupted.

> > +
> > +	/* Copy all panel timing property to the new panel node */
> > +	for_each_property_of_node(old_timing, prop)
> > +		tilcdc_panel_update_prop(new_timing, prop->name,
> > +					 prop->value, prop->length);
> > +
> > +	panel_info = of_get_child_by_name(old_panel, "panel-info");
> > +	if (!panel_info)
> > +		return -EINVAL;  
> 
> tilcdc_panel_update_prop() has previously done various allocations which
> will not be freed if you return here. You shoudl probably do all the
> of_get_*() at the top, and if they all succeed start copying data along
> with with the needed allocations.
> 
> > +	/* Looked only for these two parameter as all the other are always
> > +	 * set to default and not related to common DRM properties.
> > +	 */
> > +	of_property_read_u32(panel_info, "invert-pxl-clk", &invert_pxl_clk);
> > +	of_property_read_u32(panel_info, "sync-edge", &sync_edge);
> > +
> > +	if (!invert_pxl_clk)
> > +		tilcdc_panel_update_prop(new_timing, "pixelclk-active",
> > +					 &(int){1}, sizeof(int));
> > +
> > +	if (!sync_edge)
> > +		tilcdc_panel_update_prop(new_timing, "syncclk-active",
> > +					 &(int){1}, sizeof(int));
> > +
> > +	of_node_put(panel_info);
> > +	of_node_put(old_timing);
> > +	of_node_put(new_timing);
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id tilcdc_panel_of_match[] __initconst = {
> > +	{ .compatible = "ti,tilcdc,panel", },
> > +	{},
> > +};
> > +
> > +static const struct of_device_id tilcdc_of_match[] __initconst = {
> > +	{ .compatible = "ti,am33xx-tilcdc", },
> > +	{ .compatible = "ti,da850-tilcdc", },
> > +	{},
> > +};
> > +
> > +static int __init tilcdc_panel_legacy_init(void)
> > +{
> > +	struct device_node *panel, *lcdc, *new_panel;
> > +	void *dtbo_start;
> > +	u32 dtbo_size;
> > +	int ovcs_id;
> > +	int ret;
> > +
> > +	lcdc = of_find_matching_node(NULL, tilcdc_of_match);
> > +	panel = of_find_matching_node(NULL, tilcdc_panel_of_match);
> > +
> > +	if (!of_device_is_available(panel) ||
> > +	    !of_device_is_available(lcdc)) {
> > +		ret = -ENODEV;
> > +		goto out;
> > +	}
> > +
> > +	dtbo_start = __dtbo_tilcdc_panel_legacy_begin;
> > +	dtbo_size = __dtbo_tilcdc_panel_legacy_end -
> > +		    __dtbo_tilcdc_panel_legacy_begin;
> > +
> > +	ret = of_overlay_fdt_apply(dtbo_start, dtbo_size, &ovcs_id, NULL);
> > +	if (ret)
> > +		goto out;

As soon as the overlay is applied, the driver handling the panel-dti node
can be probed.

Modifying some properties after applying the overlay could be not seen by the
driver.

> > +
> > +	new_panel = of_find_node_by_name(NULL, "panel-dpi");
> > +	if (!new_panel) {
> > +		ret = -ENODEV;
> > +		goto overlay_remove;
> > +	}
> > +
> > +	ret = tilcdc_panel_copy_props(panel, new_panel);
> > +	if (ret)
> > +		goto overlay_remove;
> > +
> > +	/* Remove compatible property to avoid any driver compatible match */
> > +	of_remove_property(panel, of_find_property(panel, "compatible",
> > +						   NULL));
> > +overlay_remove:
> > +	of_overlay_remove(&ovcs_id);  
> 
> Is it correct to remove the overlay here? Won't it remove what you have
> just added?

Agreed, the overlay should not be removed here.

> 
> > +out:
> > +	of_node_put(new_panel);
> > +	of_node_put(panel);
> > +	of_node_put(lcdc);  
> 
> Here too you can use cleanup actions, even though the current code is
> slightly simpler than tilcdc_panel_copy_props as far as of_node_put() is
> concerned.
> 
> > +	return ret;
> > +}
> > +
> > +subsys_initcall(tilcdc_panel_legacy_init);

IMHO, the call to tilcdc_panel_legacy_init() will be too late.

subsys initcalls are called after arch initcalls.

During arch initcalls, of_platform_populate_init() is called
https://elixir.bootlin.com/linux/v6.19-rc3/source/drivers/of/platform.c#L599

The root node is populated and handled by the platform bus.

Later at subsys initcall, the tilcdc_panel_legacy_init() function is called.
This function starts by applying the overlay and so a new node (panel-dpi)
is added at the root node.

This trigger an OF_RECONFIG_CHANGE_ADD event handled by the platform bus.
https://elixir.bootlin.com/linux/v6.19-rc3/source/drivers/of/platform.c#L731

If the "panel-dpi" compatible driver is available, its probe() is called but
the panel-dpi DT node is not fully correct. Indeed, tilcdc_panel_copy_props()
has not be called yet.

Also, the legacy compatible string is removed after the of_platform_populate_init()
call. The legacy driver could have been already probed.

Of course, please correct me if I have misunderstood something.

Best regards,
Hervé

