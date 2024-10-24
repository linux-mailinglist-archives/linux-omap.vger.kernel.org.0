Return-Path: <linux-omap+bounces-2483-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D88589AF508
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 00:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 635D91F22A03
	for <lists+linux-omap@lfdr.de>; Thu, 24 Oct 2024 22:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABD3921733C;
	Thu, 24 Oct 2024 22:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aDsd6eet"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E34422B667;
	Thu, 24 Oct 2024 22:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729807429; cv=none; b=Zrn2bHrKEbOb7f0mrOIPnAR11oWvdudD5sEe367AOax0sUDqMf2mav2Q88YfSv5IoxAhiqTLMAbvp8ln+Q96fDqaUkyHPJ8YZbEGlL4H8B1Mug8neC6CRRoiscn31FrXWz4xp79w67SV6txWv95lYxJ33YxHBralZM3Hj8h6/bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729807429; c=relaxed/simple;
	bh=rvm0sqyM2Iuo+G/JA+hU3fSOwR/fA93E6NiMqCWY8ZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kmravTH5kLNPMNRti9iIq2NYzgMPRE4AyB+oifewTCay1kfLf2UPlXWSs9z/vBbBbbgoHE4RWD5BnrTkOpqqqQxhzER9rTCpon2Fc6DWqZ9pqd+0GnNrZB0oGSsCi1lw1U2EBAGM+UxjgzgIf/P983I9hiVRiDEqF/7nfRWBSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aDsd6eet; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99380C4CEEA;
	Thu, 24 Oct 2024 22:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729807428;
	bh=rvm0sqyM2Iuo+G/JA+hU3fSOwR/fA93E6NiMqCWY8ZM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aDsd6eetFsT76YujCvqrxSBlJhCRJNUngo87sX6virrURSXimyoeFnMa5ZKEoB2vS
	 sloVjhcFws7WV2JObyvAvI+z4ZXexaOdiAuky+EswMc/HKZBxCf28NsCXTkRhx3s1O
	 gOvPEpZT0eeit87A36FG+IfjCUsl0z6fQ0m5oRi/dIqEpVkdnaUWdO/0NESausgkHM
	 MN3Y15ywDOzTv0c/VI4cqnDNKt6fVbE47tJ5q8W4OavsZ+bOOL/3PSOYYhi/0yw+jc
	 DJkXNG/LBk4yCWyBALyDoKgYqrJZ0ZYGXB2N1aOQStWWGzKjjghAcjTQGyPlgkDKXZ
	 MHAZrVHT8uIkQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so23370391fa.0;
        Thu, 24 Oct 2024 15:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUF/wJ46uDtDX5RmJB00qZLIdQoNpVhRlpPlUMXakhZxf+Z1j1RzFwsZ534jFJnFDC/unAyieTKDmOzJiE=@vger.kernel.org, AJvYcCV8yMVnTa1vBq/FI0/nQVMG3ftFA66M7TpXBXJM0zqmEsg5MjRLmVJRsGU30mx0+NTzTb2Q7AI17wPfkw==@vger.kernel.org, AJvYcCVCxOR4NIDyNqdREfekd4TXdIkk4HnAEwzTucxjzRDTn8A+WUoQLAgGAYcdZ3t8zjLWHxuWR8xnW+rcBvs=@vger.kernel.org, AJvYcCWL6jadlCNQhckJnS6Y4uev/eN6DXGOzMTaw2L8pKLqAeu8cYpdnmWPUcO0VpqeBc5Ly8wK4Wlx2JUt@vger.kernel.org, AJvYcCXU4caww3SZXWGyQQ16JU0WcQ1wEaPAtLGBbhM7sCYelwvfiSx0PSr9GLER5zymrsZGAnfSsV1Qah/RgSw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw81ixjs+7eTZF+4PjIcGjneamKrra98VeCU7vkYfR4chJvdDH7
	OEUssDg2AlRozwMDSHE/dvgPb0BghYGQ4/G4+b4Y75h2gfFhxtUmgnxMGXrAqm9XYSR+7i4BwJt
	SmO2+gxgO9Y8TU28pFD3GrL4l+w==
X-Google-Smtp-Source: AGHT+IGF6eWZ0+7n7HQRyqqTejSHhmgOHjWsU/iJM8V90fYyb1ZIuNBy89dtclskBrr3PVViovbrpowh66UndWkfyZM=
X-Received: by 2002:a05:6512:3d0e:b0:536:7a79:b4df with SMTP id
 2adb3069b0e04-53b2371753fmr1240151e87.14.1729807426772; Thu, 24 Oct 2024
 15:03:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87msiub5tt.wl-kuninori.morimoto.gx@renesas.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Oct 2024 17:03:33 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKcznR3WoVjUpnWCs6KFW-DAXW1Nvr2_Usb_OzPkkoVuQ@mail.gmail.com>
Message-ID: <CAL_JsqKcznR3WoVjUpnWCs6KFW-DAXW1Nvr2_Usb_OzPkkoVuQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] of: property: add of_graph_get_next_port/port_endpoint()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>, 
	Jaroslav Kysela <perex@perex.cz>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 9:19=E2=80=AFPM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Rob, Saravana, Tomi, Laurent, Sakari, Mark
>
> This is v8 patch-set
>
> Current Of-graph has "endpoint base" for loop, but doesn't have
> "port base" loop. "endpoint base" loop only is not enough.
> This patch-set add new "port base" for loop, and use it.
>
> v7 -> v8
>         - add Acked-by from Sakari/Helge
>         - tidyup comment line
>
> v6 -> v7
>         - based on latest linus/master branch
>         - remove "ports" base functions
>         - use "port" base function on "endpoint" function ([3/9])
>         - tidyup [1/9] explanation
>
> v5 -> v6
>         - based on latest linus/master branch
>         - [9/9]: fixed compile warrning
>
> v4 -> v5
>         - tidyup comments
>         - [8/9]: parent NULL check was removed
>         - [9/9]: use for_each_of_graph_port()
>
> v3 -> v4
>         - new for_each loop includes __free()
>          - comment indicates to use return_ptr() or no_free_ptr() if
>            it need to continue to use node
>          - each driver based on it
>         - care "prev" leak on of_graph_get_next_ports()
>         - of_graph_get_next_port_endpoint() indicates WARN() if port
>           has non-endpoint node
>         - tidyup each git-log
>
> v2 -> v3
>         - return NULL if it it doesn't have ports / port
>         - add visible comment on of_graph_get_next_ports()
>
> v1 -> v2
>         - add each Reviewed-by / Acked-by
>         - tidyup/update Kernel Docs
>         - use prev as parameter
>         - update git-log explanation
>         - remove extra changes
>
> Kuninori Morimoto (9):
>   of: property: add of_graph_get_next_port()
>   of: property: add of_graph_get_next_port_endpoint()
>   of: property: use new of_graph functions
>   ASoC: test-component: use new of_graph functions
>   ASoC: audio-graph-card: use new of_graph functions
>   ASoC: audio-graph-card2: use new of_graph functions
>   gpu: drm: omapdrm: use new of_graph functions
>   fbdev: omapfb: use new of_graph functions
>   media: xilinx-tpg: use new of_graph functions
>
>  drivers/gpu/drm/omapdrm/dss/dpi.c             |   3 +-
>  drivers/gpu/drm/omapdrm/dss/sdi.c             |   3 +-
>  drivers/media/platform/xilinx/xilinx-tpg.c    |  14 +--
>  drivers/of/property.c                         |  99 ++++++++++++++---
>  drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |   3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c |  66 -----------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  20 ++--
>  drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |   3 +-
>  include/linux/of_graph.h                      |  49 +++++++++
>  include/video/omapfb_dss.h                    |   8 --
>  sound/soc/generic/audio-graph-card.c          |   2 +-
>  sound/soc/generic/audio-graph-card2.c         | 104 ++++++++----------
>  sound/soc/generic/test-component.c            |   3 +-
>  13 files changed, 205 insertions(+), 172 deletions(-)

Applied, thanks.

Rob

