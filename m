Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64EC566DF7D
	for <lists+linux-omap@lfdr.de>; Tue, 17 Jan 2023 14:53:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbjAQNxt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 17 Jan 2023 08:53:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbjAQNxI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 17 Jan 2023 08:53:08 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6653E46B0
        for <linux-omap@vger.kernel.org>; Tue, 17 Jan 2023 05:52:42 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so25866110wmb.2
        for <linux-omap@vger.kernel.org>; Tue, 17 Jan 2023 05:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/25DhdAmRN9effrRikf/37uSs969leXr6Z842JBsFSE=;
        b=AZtWpnQWY8BDm/m8EyYbjE+8TcgpWO3r9GYK8mG/O/TP594CyqQzULMyqZzwixpSi5
         fV1uh+zfw+y4DwOMeNrrbfdLToNEIGVZ1UhiZ+rAjK/anwMw1zfLNOLiBJ4Xsi8xBguA
         W791QLQnvXqrBGoO+cB7cbqsLoqV7Tt/068XvyVwYw1nZlS7ACto/mY3Vc5rhSGlqEL4
         3YwchjPKHjg+BYoxS68A4gYNLzMRND4ZtbL0YW2YrTtwYkLfMo5pNSPukVAtsd6je5Vy
         1Yu9poIDJQDTGwWvgNxf9hNs2Bqod+cq214nqN974PxX05xo2XHDGKf2dhiQVkFwEnMb
         S4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/25DhdAmRN9effrRikf/37uSs969leXr6Z842JBsFSE=;
        b=glwfEkpI8lRj8Zmde9sKFKGoOaxZKYvzRx2dBxf/LvphPUT/J2MkRBXO9Ka4aQIlKD
         kIDf3u0TEP1xdsTienjDkmluDfouK9ygArgM0YEqfRlD2FfvA2w9S2AKUEnLvBTKmYhP
         rAlazt8lUfLnTo1N+a7xswHsVGRI+aGQKxGNJHkAp/mlNKwQfaZzK6bJAKhvLTJmD8kp
         ZmBWK6L++kkshQvdcbcsXbte62PU/h0/vxvN5a0CDBVXot3gIbZeONFZH518Vz1CFfKq
         U17A/Qvw2OPqYfzY8pdDi5qOnuK3btTM8pgB7+EIfjpW5VZOHC5PUDG7semToLHJeXwv
         zkKw==
X-Gm-Message-State: AFqh2krD0dlS2rn0RR9K5x2Xlm2R5ip/WAs4zpXNLMz81NBp1R8Z2jXr
        Ve89ku0bv3wz8HVCUW/mvJuTmCAKjL8=
X-Google-Smtp-Source: AMrXdXvEXubDtmLSAgB6pYCkTtWIdNHLF0Jx91Jcozod3o5PcKAlP8H00jdl0j+knKMxsLhVy7Wl9Q==
X-Received: by 2002:a05:600c:a54:b0:3db:887:8c8c with SMTP id c20-20020a05600c0a5400b003db08878c8cmr2167613wmq.27.1673963560691;
        Tue, 17 Jan 2023 05:52:40 -0800 (PST)
Received: from DESKTOP-53HLT22 ([39.42.178.198])
        by smtp.gmail.com with ESMTPSA id d6-20020a05600c3ac600b003da0dc39872sm19225820wms.6.2023.01.17.05.52.39
        for <linux-omap@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Tue, 17 Jan 2023 05:52:40 -0800 (PST)
Message-ID: <63c6a828.050a0220.82e81.c21c@mx.google.com>
Date:   Tue, 17 Jan 2023 05:52:40 -0800 (PST)
X-Google-Original-Date: 17 Jan 2023 08:54:15 -0500
MIME-Version: 1.0
From:   glennharland437@gmail.com
To:     linux-omap@vger.kernel.org
Subject: TakeOff
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_SORBS_WEB,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

=0D=0AHi,=0D=0A=0D=0ADo you have any estimating projects for us=0D=0A=
=0D=0AIf you are holding a project, please send over the plans in=
 PDF format for getting a firm quote on your project.=0D=0A=0D=0A=
Let me know if you have any questions or if you would like to see=
 some samples.=0D=0A=0D=0AWe will be happy to answer any question=
s you have. Thank you=0D=0A=0D=0ARegards,=0D=0AGlenn Harland=0D=0A=
Crossland Estimation, INC

