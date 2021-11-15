Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07B3450136
	for <lists+linux-omap@lfdr.de>; Mon, 15 Nov 2021 10:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236942AbhKOJ11 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 15 Nov 2021 04:27:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237601AbhKOJ03 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 15 Nov 2021 04:26:29 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE33C061208;
        Mon, 15 Nov 2021 01:23:13 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id g14so5267605edb.8;
        Mon, 15 Nov 2021 01:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=gBgwejPY1dviUk6Pvy613Rd4JE1KH9DV1AZPEpByebo=;
        b=Uet5TuXIzgLsxmK1fLb3++n8QOIDms/8jyEfRNMDwZ4kx3hxE+heyXVP2hxM3GSo8O
         JX7PWuOawm53fNBXadKtZIqtQ/3vX2MvFIK+/0Wk3NOOs3szQlWeF+dpScPZLIRYDIs/
         2MVSj30C8wgGxyDve1FC4q/TC5xU6Sj7RrGWCyHTyvc7VXHf4Qwb42eN8w+cRAYs6SDW
         kw8FCs/sF0xWO3IpbXR3Uqw0T7IU60fp8adv4YOmsth65PFrkyyQrbmjkqhM7ayYYKzw
         e2iyMR2fVvuN/ukdzgNfqNKJ5ekhuuMX6RkEydm0xEKudJKpLlMGdZQg80Fr0U/+n5Di
         06Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=gBgwejPY1dviUk6Pvy613Rd4JE1KH9DV1AZPEpByebo=;
        b=YpoFksOjoROwq2uLsTy4D3ffoTU/XQlIiu13ZIZT1Vx0fBrQb0FaRoT7vTtxHIEUN5
         jvU+7PzM7iJezMbEswpPJtDWLnybbUo5Dp4294FBuRu45hzR4YLQ7vq9QJ5+7AcwKgCj
         gnc3qbBUdGBi9Bof4eRJL65UuoW7DxxWLjMU3aDOepMp0pislgtnJtsLxCrHs9K3o3U8
         GIXHm8PGwQIey45rhvrNSpmUzLFwQSZfPctlbJBW3ta3jRQ/+3P47+JrJLZu1c/Ys0mU
         MbJBIOnDJI7FYJqO+odqmNnbVxHdXpR52WxqkNkNsBVHR4ea9sogpCRrfvk0grZFU65q
         /KIQ==
X-Gm-Message-State: AOAM533eoLfZ+H3etrr00ajO3xVzthqPvP31ut7S/YNXjnrieB0qudaS
        W5BOgG1/zsMVqD6ueLssra8=
X-Google-Smtp-Source: ABdhPJxVLgYJEPdc4dPvGR8syXlhzKmQJhhBnDs4nwUFdB87i9JVWf2CTW1QPqiysLtK6Kq01c797g==
X-Received: by 2002:a05:6402:11c9:: with SMTP id j9mr884443edw.346.1636968191417;
        Mon, 15 Nov 2021 01:23:11 -0800 (PST)
Received: from chinchilla (178-84-91-79.dynamic.upc.nl. [178.84.91.79])
        by smtp.gmail.com with ESMTPSA id nc30sm6439077ejc.35.2021.11.15.01.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 01:23:10 -0800 (PST)
Date:   Mon, 15 Nov 2021 10:23:08 +0100
From:   Matthijs van Duin <matthijsvanduin@gmail.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, airlied@linux.ie,
        daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] drm: omapdrm: Export correct scatterlist for TILER
 backed BOs
Message-ID: <YZIm/GiRWv0nPN5b@chinchilla>
Mail-Followup-To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, airlied@linux.ie,
        daniel@ffwll.ch, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1636796417-5997-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1636797239-6384-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36598203-eced-131d-85ef-f4940872e751@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Nov 15, 2021 at 10:42:41AM +0200, Tomi Valkeinen wrote:
> A BO's memory via the TILER memory is
> contiguous, although with consistent gaps of
> memory that should not be accessed.

But pretending that these "gaps" are part of the buffer is a security
vulnerability, since that memory which "should not be accessed" may
belong to different security contexts, and exporting the entire
contiguous region covering the buffer allows untrusted contexts (e.g.
userspace) to access this memory.

> IPs that might use TILER
> backed BOs only support contiguous memory.
> 
> This means that the drivers for such IPs cannot
> use the BOs exported like you do in this patch.
> I believe the drivers could be improved by
> writing a helper function which studies the
> sg_table and concludes that it's actually
> contiguous.

That indeed sounds like the proper solution for such importers, rather
than making the exporter lie about the buffer bounds to work around
limitations of these importers.

> Did you look at the userspace mmap of TILER
> buffers? I wonder if that goes correctly or not.
> Isn't memory to userspace mapped per page, and
> lengths of the TILER lines are not page aligned?

Mapping to userspace uses an ugly hack whereby small slabs of the
buffer (4096x64 (8bpp), 2048x32 (16bpp), or 1024x32 (32bpp) pixels) are
dynamically mapped to dedicated page-aligned regions of the TILER
virtual space.  For each of the three bitdepths only two such slabs can
be mapped into userspace at any given time (on the entire system), so
using this mechanism to render graphics from userspace can easily cause
hundreds if not thousands of page faults per second.

The alternative (used e.g. in the pyra kernel) is to force all TILER
buffers to be page-aligned, at the cost of wasting some TILER space.
This will presumably also be necessary to allow SGX to import these
buffers since its MMU can obviously also not map data which is not
page-aligned, same for any other importer which uses an MMU to enforce
memory security (rather than being trusted to simply refrain from
accessing data outside the declared bounds).

Ideally such page-alignment should only be applied to buffers which are
intended to be consumed by importers which require this, though it's not
clear how that might be accomplished.

-- 
Matthijs van Duin
