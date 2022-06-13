Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49D3254A080
	for <lists+linux-omap@lfdr.de>; Mon, 13 Jun 2022 22:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351194AbiFMU4Y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jun 2022 16:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244364AbiFMUzO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Jun 2022 16:55:14 -0400
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com [IPv6:2607:f8b0:4864:20::941])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90086318
        for <linux-omap@vger.kernel.org>; Mon, 13 Jun 2022 13:27:14 -0700 (PDT)
Received: by mail-ua1-x941.google.com with SMTP id l12so2556720uan.5
        for <linux-omap@vger.kernel.org>; Mon, 13 Jun 2022 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=f/v1gZW2d1xf+y6gXLTGdOPEOS7UDztcZyURQzQMDp0=;
        b=hBL6eXjmdCpeOYUu6PZitW078IexrNWrHvPE7fJdiYUUcvE+ZHLZB3oDXbquUPVrki
         NbgCTeHzUEoSvo4jSAF99QmtSMbh42Gvo9j/TUBP3UoSMDXgBmBSEgnojx7nVYmb0nQs
         S+MSxd213LM21Egup/ThB8ivn+XJmxc4h49ZoMfVU923Y05P495OLo3eeykrijYrpneg
         r+oBpYeI7ZoArMMhyzlZKu1yZ5v5tE+HZ4J+e4iWfk01Hp2p2jmRV1Mhn9iqCjeXTSz1
         iIKSXMDdGhA84624GSLSngci2p98ByBladETwREnGX1BpnBRt9jXmROyl2BT7W8bgGCv
         B7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=f/v1gZW2d1xf+y6gXLTGdOPEOS7UDztcZyURQzQMDp0=;
        b=k9LS4KfkNa/h5UiFMtizcpJFlIzeFxGnksNZyDZVgrHCXMjWbG2SGr8yI8uifmPdjg
         k6+T1HtsW+vayUIDrjsiNsl+/zGlCklXIkmtnw4vXGaX/IT1pVOHavv98P70MXbovaXq
         CRrQv14+upIgaTd3/lC8REHv79axM7llqszUM8aPFfahtfe6zttexb63qzMHuM10uu47
         ykFxkTqz+c/tIXwPDGqVUX1Ng70Q94tONvId703lhJVV23bQK2ecoDBLKvNYRe1ElBhl
         xAIj7nQvK2M4B50rK6iToxG4+Oe+dCiDoJWbheAzxreJasVFAOLqeGOnLdRUzdUJUAde
         RaWw==
X-Gm-Message-State: AJIora9qUJXyBf6pBvOcm+NZumyupiKIgy4qz3Ag2Y2ooWaxnzBR9jLf
        uf5XS5958ZJcLuM5euVixXq3Uc0zjwi8q7vm4KY=
X-Google-Smtp-Source: AGRyM1vTeYWRPYutHTXabV966Dr3wDjNi4nW/jTL1btmzXJFJy4isVcTwe+uJ6KzKEgLakmNeEqtOMvt9oDVQQgkIBw=
X-Received: by 2002:ab0:76ce:0:b0:35c:c69e:717a with SMTP id
 w14-20020ab076ce000000b0035cc69e717amr718998uaq.117.1655152033908; Mon, 13
 Jun 2022 13:27:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:bf8a:0:b0:2ca:3b5c:ca48 with HTTP; Mon, 13 Jun 2022
 13:27:13 -0700 (PDT)
Reply-To: nikkifenton79@gmail.com
From:   Nikki Fenton <gustaviagrowe629@gmail.com>
Date:   Mon, 13 Jun 2022 22:27:13 +0200
Message-ID: <CAEmpkiADS0OWruKaoA1k170OK=hS+-5g+DZRrVxOtRmWNgJY3w@mail.gmail.com>
Subject: Please Read
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
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

Good Day,
I viewed your profile on Linkedin regarding a proposal that has
something in common with you, reply for more details on my private
email:nikkifenton79@gmail.com

Nikki Fenton,
nikkifenton79@gmail.com
