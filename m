Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 156B962DCE
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2019 04:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbfGIB62 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jul 2019 21:58:28 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:34819 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbfGIB62 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jul 2019 21:58:28 -0400
Received: by mail-io1-f66.google.com with SMTP id m24so30269451ioo.2;
        Mon, 08 Jul 2019 18:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GkkAho5u9ZRo8sAo/m6sBY3/HBCvrNggwRmK+JAndDo=;
        b=X/fPYeauxCDD8+Xc26ahyju/GqDs7p9si3t6UY59f7xXPRbX5HI7qbnLASVIxeDaxB
         /Z+fRC+gZMNFg/BuaNW4UgoLmT+xoySMZ1RYM5JsScE9nuKXkt0K9SnOG9IbtU9nomRW
         iRLOPcLjiP/QKiq1rJr3bjlg0cD+AvLKC6gBT2nwfFhn3HN2wnX9T9nvNglhfdtxekLi
         /twKdUHQP2iqP0iLrCsm1z6GgaD6bmWFKTUEBJBHWOLKrFsdcHx9NE8mnXkgQFff3QAb
         Tq0k1K2+DVEADGeGnnrzewm08WcODz1W/nlkG6jKOl66YU5HQkW4DYcam9JGuCCnSGtO
         qDIA==
X-Gm-Message-State: APjAAAVa/NhnFUj0oamwqwk4gE6TRgCe7lB7OkMc3vX1z2DeDHdpxPbJ
        NKLxB8s1q7Y1Rlumq0V3Fg==
X-Google-Smtp-Source: APXvYqzFMBYbPmXb2HfLpyr5pupdnhjP1NM+px7xYIHdBAoiAWfhkkQfdUbKjMiGk7ldZbL+nLrPZA==
X-Received: by 2002:a02:ab99:: with SMTP id t25mr24471171jan.113.1562637507345;
        Mon, 08 Jul 2019 18:58:27 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i23sm14676192ioj.24.2019.07.08.18.58.26
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 18:58:26 -0700 (PDT)
Date:   Mon, 8 Jul 2019 19:58:25 -0600
From:   Rob Herring <robh@kernel.org>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, tomi.valkeinen@ti.com,
        imirkin@alum.mit.edu, marek.belisko@gmail.com,
        Mark Rutland <mark.rutland@arm.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, letux-kernel@openphoenux.org,
        devicetree@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3 5/5] dt-bindings: drm/panel: simple: add
 sharp,lq070y3dg3b panel
Message-ID: <20190709015825.GA4312@bogus>
References: <cover.1559905870.git.hns@goldelico.com>
 <ee90ed56d2c294ce8ac3b44bf2229c5ab9f85e91.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee90ed56d2c294ce8ac3b44bf2229c5ab9f85e91.1559905870.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri,  7 Jun 2019 13:11:11 +0200, "H. Nikolaus Schaller" wrote:
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../bindings/display/panel/sharp,lq070y3dg3b.txt     | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,lq070y3dg3b.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
