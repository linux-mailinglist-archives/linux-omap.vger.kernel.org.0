Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D755449A6C
	for <lists+linux-omap@lfdr.de>; Mon,  8 Nov 2021 18:06:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240422AbhKHRIq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Nov 2021 12:08:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239443AbhKHRIm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 8 Nov 2021 12:08:42 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B164C061570
        for <linux-omap@vger.kernel.org>; Mon,  8 Nov 2021 09:05:57 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id b15so45915428edd.7
        for <linux-omap@vger.kernel.org>; Mon, 08 Nov 2021 09:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=EdQX4PxWK6+nWKGEzFg5VrRej49m6SAaTbWSLjDxZhQ=;
        b=KVkmxWEJjLiI/mpeH8T57HdP9MvoQP7dviuXoIgucntePcGpNcpmLg1BdJCXkiwtrC
         Ekpyh/7W9XWcgOKbzcPUPdIg9a+0LceKLHyggJA5xlpfIogr2I4dogzJmt7u7gXgiAiT
         L+Z9XnNEl6M7xX1PoI188LpMLY8e9aZrVYpXy2GDwnaGdIz7b2w+CeU2ws/b1Ey5aEgc
         Gy/rr8IMPkjJQMjR5QV6Z7eWGg/2/l/rXzepAe4k8uY8vi0tVuSrBtqMeEHX5I23m2dZ
         tjfBhpKkLj65tQL2IzJ8517bM1H9AVY19gbq/yD5/AUvbNaxF4HBHelnwJcIP0s1jcfG
         G/cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=EdQX4PxWK6+nWKGEzFg5VrRej49m6SAaTbWSLjDxZhQ=;
        b=1FmPutqA1RDTSVIL69zB8AuoANTYylXn6I3SkBTPHaZfIvz4FIEujekD48F3X+3BIc
         w1ns0THRXn8bXKlkce0aicbs6s+dSxLkiwC2rboZnN2ycpvVvsmLVlspToku2yE1UPzg
         A/TH8Vh2FslprUqoA1rAiRS6eYPVOjpyE/G/d6yHcQWpM7ce/BzyiNtkcKmD0rlgOL6B
         G3mKejmt+XG6VhfXgY34WL7g8LWRw/2fahnM1n41Sdy2uXPifXE6jglsnrbptq3IRvpF
         8tH1gVJfltIp/VB/eQgD0+q1jz1gRYTP58D1sUqD2Vl3FEOo0M1tMF2QHTHlULNDMSm8
         HH/A==
X-Gm-Message-State: AOAM532LfyBtd3XU+UnfVINYUaT39ZTeT+YYVzBNQm6S0OIwPlYf6ulo
        oogSPWzo3VVTK4e84ZZpH1IvD9ElY5Y=
X-Google-Smtp-Source: ABdhPJx25TlctMjlzWZHGi+lZWtnUIgQ/2121A1ngK1BLqvNfldd9q7mr/ny++mRj68C9zSrpfIbyA==
X-Received: by 2002:a17:907:3f95:: with SMTP id hr21mr875361ejc.427.1636391155826;
        Mon, 08 Nov 2021 09:05:55 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id bm2sm9604069edb.39.2021.11.08.09.05.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 09:05:55 -0800 (PST)
To:     "Valkeinen, Tomi" <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: omapdrm VRFB rotation
Message-ID: <92fd80eb-6591-fb45-8885-309c79c2d4c0@gmail.com>
Date:   Mon, 8 Nov 2021 19:05:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Currently omapdrm supports TILER rotation only, which excludes omap3 and 
earlier SoCs. I have the hardware (N900/N950), time and will to 
implement VRFB rotation support in omapdrm driver, however, I'll 
appreciate some hints. Or, if there is already something ready, please 
point me to it so I can take it from where it is.

Besides partially reverting 517a8a9564c0dea98e6d4e2c7f0fe4cbb9b8c9ba and 
copying VRFB code from omapfb, is there anything else I shall take in 
consideration? Or, VRFB driver should not be a part of omapdrm, but a 
standalone one?

Regards,
Ivo
