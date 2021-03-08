Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 590FF3316E2
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 20:00:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhCHTAE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 14:00:04 -0500
Received: from mail-io1-f42.google.com ([209.85.166.42]:40689 "EHLO
        mail-io1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230502AbhCHS7c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Mar 2021 13:59:32 -0500
Received: by mail-io1-f42.google.com with SMTP id i8so11109477iog.7;
        Mon, 08 Mar 2021 10:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d/wMVNVlgeXsHNDoOPos1VXzlcySie+Bw+kV8ZOpozo=;
        b=uLblZwcDzDgFQ1RN3v24e5eybgSEWI63fS35BcZgDS1UYpZHA/aGiXA1pfIWWhpGGK
         hPzoRvKBE+UaHS8m3INuoF2ro+mvsLgpr4oscLMp5XryXB7oX8GvVd6DjOPsB2A8JsLm
         Zi0uRUbsISl/1f8tbEqeTuS3/2ifEOs9BxVgoUoMS/RbvRI9y0lxGHZKFiPA0cjjBl1c
         YEakMcLGdFdv7uC7ndcFprS0Zzqe+qc77TmBVZkavsRsZzHcVj6hzmqWLTSDRqz94ZKN
         44CzNeWOFaXgqit4XDO1yqNbDVZYkOuJG9m9fI0t5vwfPtvBD+Qpkaf4GeICG/Uf8lMY
         mqsg==
X-Gm-Message-State: AOAM530Fd1k2vj8keSCO1tGkKMhlSmbVHb5pOR9MQ1TkLhbri1SwcbL3
        8fXZjw9kd1x9/SYmhlJT9Q==
X-Google-Smtp-Source: ABdhPJw6RyzF1y6r+1o51v3mjB+0yXs2OCrY5Yao6MT2OKQLX/XIZkRNaeWhrvtEJRWCWWEj7PpHlA==
X-Received: by 2002:a05:6638:144e:: with SMTP id l14mr24629378jad.76.1615229972355;
        Mon, 08 Mar 2021 10:59:32 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id c19sm6441129ile.17.2021.03.08.10.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:59:31 -0800 (PST)
Received: (nullmailer pid 2788650 invoked by uid 1000);
        Mon, 08 Mar 2021 18:59:30 -0000
Date:   Mon, 8 Mar 2021 11:59:30 -0700
From:   Rob Herring <robh@kernel.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCHv2 4/6] dt-bindings: display: ti: ti, omap5-dss.txt: add
 cec clock
Message-ID: <20210308185930.GA2788568@robh.at.kernel.org>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
 <20210302162403.983585-5-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210302162403.983585-5-hverkuil-cisco@xs4all.nl>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 02 Mar 2021 17:24:01 +0100, Hans Verkuil wrote:
> The cec clock is required as well in order to support HDMI CEC,
> document this.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
