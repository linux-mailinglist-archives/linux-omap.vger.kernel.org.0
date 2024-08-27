Return-Path: <linux-omap+bounces-2026-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AE672960CFB
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2024 16:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B21BB280D4
	for <lists+linux-omap@lfdr.de>; Tue, 27 Aug 2024 14:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1381C4639;
	Tue, 27 Aug 2024 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cepbEcsj"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA481C2DD2;
	Tue, 27 Aug 2024 14:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724767517; cv=none; b=GnUtI7cId7zVVnNhf+bENgADVPqkPsN1ZVcLcrbDx73P6jeaLM42zWElT+8A6H9hkWeeLRvnDObepPvoVROwcg1J6uxhJOnWV1lALR5VGhat3hI/zI755aoh/Gm/+9pgVn2Z4jfYaDFFjEkwpASHELaVKmEaoHK8XTH0HO5P1XY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724767517; c=relaxed/simple;
	bh=LKBzwLK1VuRCG247aZ18hkKv8Cu+JZVib28vpysx80E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KlIsfW4M8fzb2TqReGP6ny/r+fIFVHDhTfTrIzOVx8EOl2hbMhopb1V8geG7/UzXaQSSg96Q9hsEPgqBaxb6yPEo3uVN8NRyrdx0AiCxiJTlAwOi3WBX1xVTDmnb5nxx+FQoHzG2xHa1P6P/CGGyOsAkyLhrmNIqML/GeC4S0pE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cepbEcsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06326C61073;
	Tue, 27 Aug 2024 14:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724767517;
	bh=LKBzwLK1VuRCG247aZ18hkKv8Cu+JZVib28vpysx80E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cepbEcsjf81GL1oTNQ4cpG2rya1VZgaBMQ5UK+Eef8HF7HrmE4NgZchfghQqUuOQ1
	 B9zows4udjTc8PvO/15qa2CKES/aSaYQAbDEpnyZXfi6lO2/h2VeDM4b/E2BuG/HbK
	 bcguEJocmarmkPaH2NWtYQqWerl7WKmmrrSxP5NlBJxPSex0nAOP5JkmSAurmimAOv
	 3UV85kxV8JNnaaj01N/DL394XITUeKKSAC3Vf7Xeyeb5m70iuFBhQOh4VdkLUG7uZv
	 mGGepPeI8+7RdEABg0cLfiaKFExxg4wwdPTvQOv8H5dDHyCUaZmBOudvzv0jz3KH7l
	 guzD0PZEbiaoQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5334b0e1a8eso7286823e87.0;
        Tue, 27 Aug 2024 07:05:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGaEikVsmVG2Dh6/4SeoJcCw8bdA5n1wz9/Enukmsru24/ht/SQ0S0L3ByTzyfjVmLgrI6sB4SKEyMYFI=@vger.kernel.org, AJvYcCUdkXBhGhxMGYDgdXTvqZAX00dqW6LQp6JawJ4fpCp6SRhwqd5r4VCY49HtqczsWf22XJtZaTh89zLqyFM=@vger.kernel.org, AJvYcCVH5TtZWRGWHrmqqeYoja3LbG2mepqleY8lfk9Im5mU8w7rtee28imDurHEQ5IoOR0ZLmsTZO81sEzXiA==@vger.kernel.org, AJvYcCVbNvmn1+kISpH0qgCPZ91Ii+rPUDobmLEOM/MXnMTZk9o/yykeN4NbQxZY5M9ok6pfi88fbJe0DSia@vger.kernel.org, AJvYcCXRk44K0EbcB2+SWp5gAu+tzLh2E9WkCPZYkZSb9YaHLWZxnC9a+z9mi26wWa1yn3IhhkRsCcpDyD8WYB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhQjtMxKeau31qWnMf0gZP1NEnKOE1TqD4yA+YywtzJSigIz+k
	WdIKTOCFGQxZsKncw2kWopJLPtbSiAoCFvBmjbyGHM4qmjBA40lRgtsZHMSa4djCKjlVQznj8J0
	Fnfe7RMP6RkD23x/iQ5aRR7J4Fw==
X-Google-Smtp-Source: AGHT+IER8wl94tUFX0eKrTywG7PWQXHkf/Kibv/Fvx5W7HJEPoMeI4PCXKA6CTewYNf/vhQ7d085ZoNSwSxadgFvBDE=
X-Received: by 2002:a05:6512:31c4:b0:52e:f950:31f3 with SMTP id
 2adb3069b0e04-53438785441mr11027241e87.35.1724767515105; Tue, 27 Aug 2024
 07:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com> <20240826154009.GA300981-robh@kernel.org>
 <Zs2tYUh3PXv-0e20@valkosipuli.retiisi.eu>
In-Reply-To: <Zs2tYUh3PXv-0e20@valkosipuli.retiisi.eu>
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Aug 2024 09:05:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLcM3r0dPHX9eoU3cz78UxBfg3_DnU4eKX7aohbYC2mRA@mail.gmail.com>
Message-ID: <CAL_JsqLcM3r0dPHX9eoU3cz78UxBfg3_DnU4eKX7aohbYC2mRA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Saravana Kannan <saravanak@google.com>, 
	Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 5:47=E2=80=AFAM Sakari Ailus <sakari.ailus@iki.fi> =
wrote:
>
> Rob, Kunimori-san,
>
> On Mon, Aug 26, 2024 at 10:40:09AM -0500, Rob Herring wrote:
> > On Mon, Aug 26, 2024 at 02:43:28AM +0000, Kuninori Morimoto wrote:
> > > We already have of_graph_get_next_endpoint(), but it is not
> > > intuitive to use in some case.
> >
> > Can of_graph_get_next_endpoint() users be replaced with your new
> > helpers? I'd really like to get rid of the 3 remaining users.
>
> The fwnode graph API has fwnode_graph_get_endpoint_by_id() which can also
> be used to obtain endpoints within a port. It does the same than
> of_graph_get_endpoint_by_regs() with the addition that it also has a
> flags field to allow e.g. returning endpoints with regs higher than
> requested (FWNODE_GRAPH_ENDPOINT_NEXT).

Looks to me like FWNODE_GRAPH_ENDPOINT_NEXT is always used with
endpoint #0. That's equivalent to passing -1 for the endpoint number
with the OF API.

> Most users dealing with endpoints on fwnode property API use this, could
> something like this be done on OF as well? Probably a similar flag would =
be
> needed though.

I had fixed almost all the OF cases at one point. Unfortunately, there
were a few corner cases that I didn't address to eliminate the API. So
now it has proliferated with the fwnode API.

Rob

