Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B033E59E75E
	for <lists+linux-omap@lfdr.de>; Tue, 23 Aug 2022 18:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242566AbiHWQdN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Aug 2022 12:33:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242134AbiHWQcz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Aug 2022 12:32:55 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A16D30F5F
        for <linux-omap@vger.kernel.org>; Tue, 23 Aug 2022 07:55:23 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id j21so22560304ejs.0
        for <linux-omap@vger.kernel.org>; Tue, 23 Aug 2022 07:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc;
        bh=kcZH0XFI9rPQBjcCNJ5DzSASq8sai2Rb7ZsWe4GbV8U=;
        b=MLlwkN9J4gW9zuRGDgG+KqRm6nxQsb84/9ieVbPCeqq3QT3i4rwD4tcROAcakTNiie
         yPcwrclysXL4M7kf0K9/ac//Wbv7nx7eC29i8mORvHW12qJhw1LlLh//RRj4tu4/+HDO
         8UEqSaZCutwZJBiLEJMC6VKV6qjb/eCTBvxANLBkZePhs+bzl71pirIWZmQCL4H4TbKD
         UijXprbgj3OVvyROI1IdNwfKi5RP6yFL1kIw6mZzNcL/Yhgdaf1W8DGuwY2uKemoUT8N
         4/YBh6s+JDtHWICcfs6TTR/eFkJ/rVCcTHtiB/LZ9GX5ZgOtpFaiaD0l3VtCq9GJx9Ru
         xZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kcZH0XFI9rPQBjcCNJ5DzSASq8sai2Rb7ZsWe4GbV8U=;
        b=rjwCozkISot5HBb0I/uoy9kwO9V2Y2XvQolyx1hbf3xdCRY47IaYZj75B8817fBhGo
         IrOHyPl24mde50JF3fXY6ee1YUzI+cLz0nEXl/LrLqDeButHTNUdovzihYBD3AX5OLvU
         zQonoFYkWHO1+1nzpRqvuaJ83/q2lhqANZehYCzc9Rv2CBc5eU4RD1yLDwb+CfF18GtI
         5gDnyxygJFgaT4uONE+hSNgMRU2KgaIntnJ+QVGveHh9MNyA7w2d2z5B25OUl5BS4wcy
         MX4Ib08/YCYo7kfDs2lPbJAkktfFCgFGH8SZlFBBYE0/5FhhUrm/rzmJFtYCsC/l2P5O
         74EQ==
X-Gm-Message-State: ACgBeo0fedJx0KVlMjx5Nbwco70A9l9Cqh2NVPaOQZbALI6z/iONGwfK
        I2IhxeYdNoRzfO3DkTG6BNYK2TpKqXCw5E456KY=
X-Google-Smtp-Source: AA6agR7hWJqmLICvsB8h0/ynCU+L9dZgTqOV2anioMmdrX+cCoxKZq134i4HgJG8hHy5/5MixBMv2ugJ6AgfkCVMXKY=
X-Received: by 2002:a17:907:7256:b0:73d:9c6b:35e2 with SMTP id
 ds22-20020a170907725600b0073d9c6b35e2mr2681057ejc.197.1661266522226; Tue, 23
 Aug 2022 07:55:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:907:12c8:0:0:0:0 with HTTP; Tue, 23 Aug 2022 07:55:21
 -0700 (PDT)
Reply-To: sgtkaylam28@gmail.com
From:   SgtKayla Manthey <patriciahoroho3113@gmail.com>
Date:   Tue, 23 Aug 2022 08:55:21 -0600
Message-ID: <CAHZ31W5YOKVxOn5rHy8va7PGsH=t8vFubS+6Z5Qus+SCXcnx3g@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

LS0gDQrhg5Lhg5Dhg5vhg5Dhg6Dhg6/hg53hg5Hhg5AsDQrhg5vhg5jhg5jhg6bhg5Thg5cg4YOp
4YOU4YOb4YOYIOGDrOGDmOGDnOGDkCDhg6zhg5Thg6Dhg5jhg5rhg5g/IOGDm+GDneGDm+GDrOGD
lOGDoOGDlCDhg6Phg5nhg5Dhg5wNCg==
