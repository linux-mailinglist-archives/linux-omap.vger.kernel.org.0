Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31B3E221640
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jul 2020 22:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgGOUah (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jul 2020 16:30:37 -0400
Received: from mail-io1-f43.google.com ([209.85.166.43]:45524 "EHLO
        mail-io1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgGOUag (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jul 2020 16:30:36 -0400
Received: by mail-io1-f43.google.com with SMTP id e64so3651437iof.12;
        Wed, 15 Jul 2020 13:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=yYUQrUg8P+/Z2qQaRZUnCH8LNzb7PJi2wPNt7qBjrAk=;
        b=QFF11bEGwK0l6zQWIhEYgsC7w3qZla/zGwOxl58k+5kHHbz5/SaGdobToWrSfXtdmU
         dbr4L3iuk2ePeaBnDkUgqmdPw84GYPcVLyxgOXq7mQgSBtkRs0xCMI0TScLahh3UNq65
         I3LFX6s8WaQ7Khz64S3mCCbOJGL2b/Ua57JIxkcUGUh0KBMh3W6H2xfew5bVPDStg9BN
         PMxGfq5RB0Kt0pP/yZ6FqR92GKNcTbTYPk4Sft/EDzGo4Y644lAzPHpIPpAWZoBEI9pE
         OUFPQjtwZqEyUAgs4fGzTfMzAFQsfUgw7B/U971fRqt2safVGph7aV0a0JD3ZGSzQnQi
         qILQ==
X-Gm-Message-State: AOAM532h/O1fK9zaL1R+0zeT2Ydzj/EV0vktKSa3i2k5ZJ1j96ZSm3pt
        NFkchSvea6Sza5c95cwsqA==
X-Google-Smtp-Source: ABdhPJy/Dkdfg1gv5bU+wnbD/kvGdXdWEHoc1q9BvuFWtmaNw+uFMhXfRK/BiwT7u5MnV+3YpU7dbQ==
X-Received: by 2002:a05:6602:1581:: with SMTP id e1mr1165025iow.44.1594845035932;
        Wed, 15 Jul 2020 13:30:35 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id o7sm1692424ioo.4.2020.07.15.13.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 13:30:35 -0700 (PDT)
Received: (nullmailer pid 767349 invoked by uid 1000);
        Wed, 15 Jul 2020 20:30:34 -0000
Date:   Wed, 15 Jul 2020 14:30:34 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sebastian Reichel <sebastian.reichel@collabora.com>
Cc:     Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Merlijn Wajer <merlijn@wizzup.org>, kernel@collabora.com,
        linux-omap@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCHv1 1/4] dt-bindings: display: panel-dsi-cm: convert to YAML
Message-ID: <20200715203034.GA767277@bogus>
References: <20200629223315.118256-1-sebastian.reichel@collabora.com>
 <20200629223315.118256-2-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629223315.118256-2-sebastian.reichel@collabora.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 30 Jun 2020 00:33:12 +0200, Sebastian Reichel wrote:
> Convert panel-dsi-cm bindings to YAML and add
> missing properties while at it.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../bindings/display/panel/panel-dsi-cm.txt   |  29 -----
>  .../bindings/display/panel/panel-dsi-cm.yaml  | 100 ++++++++++++++++++
>  2 files changed, 100 insertions(+), 29 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.txt
>  create mode 100644 Documentation/devicetree/bindings/display/panel/panel-dsi-cm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
