Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA2162DCB
	for <lists+linux-omap@lfdr.de>; Tue,  9 Jul 2019 04:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727015AbfGIB6F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Jul 2019 21:58:05 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:37598 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbfGIB6F (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Jul 2019 21:58:05 -0400
Received: by mail-io1-f67.google.com with SMTP id q22so17928813iog.4;
        Mon, 08 Jul 2019 18:58:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GQzbbETa6UJgKSdt3O2pS1PP4bzJVAkM84nBoYUJVt4=;
        b=SK8HrCUBm8y9NxtJR2ccD5Zut0P+dTklBJU15LtqYZh+r6R6qD2kpKCKUS7J2mi2kQ
         nCeESdJoyf79TNc8balH+aFhOLGYHXETTepE/DIX5DljumpdgJDb0a/KI2NJ6b4xinBN
         KWe65NT9BpvxZVkACHGnSDSuZZ8wtcW/dNw5au20IA6IFC07TYVEChuZFz7a7ohodY/R
         uzk0G/18ptsa5jx/yFSv9ZEXB/CsE71Rt9XXvhJFe550QNYmxQ1ZlsAOEWbNiaG89sUP
         c3PoTmai3MK+XdM5QKtTdfqb5//014bZdjZ9F8BW91sHbAfI76J2/m8TffQR4c3dsu4k
         mEiw==
X-Gm-Message-State: APjAAAXdWmNJyNnqKbdtQriEc1SnFuEZ2GzMTYQ06SE4XUFPnUXQAJ5L
        Y9sDy3t1eudJTqwa2FHg5g==
X-Google-Smtp-Source: APXvYqwRfm1mV0jx2un6sBO/Qnr82FWgfeB8yB5BMAvV9kilncXU03hkVZDSAK3hCr0ZBi8kzOpdrQ==
X-Received: by 2002:a5e:8209:: with SMTP id l9mr4080606iom.303.1562637484150;
        Mon, 08 Jul 2019 18:58:04 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id a1sm14209071ioo.5.2019.07.08.18.58.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 18:58:03 -0700 (PDT)
Date:   Mon, 8 Jul 2019 19:58:02 -0600
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
Subject: Re: [PATCH v3 4/5] dt-bindings: drm/panel: simple: add
 ortustech,com37h3m99dtc panel
Message-ID: <20190709015802.GA3451@bogus>
References: <cover.1559905870.git.hns@goldelico.com>
 <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e0720fbddfd7b35ad8551440544411485d8ad9f.1559905870.git.hns@goldelico.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri,  7 Jun 2019 13:11:10 +0200, "H. Nikolaus Schaller" wrote:
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../display/panel/ortustech,com37h3m99dtc.txt        | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/ortustech,com37h3m99dtc.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
